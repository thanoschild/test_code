
import base64
import datetime as dt
import json
import time

import functions_framework
import google.auth
from google.cloud import secretmanager_v1 as sm
from google.cloud import storage
import requests

PAGE_SIZE = 500
PAGE_PARAM = "page"
SIZE_PARAM = "page_size"
NEXT_PAGE_FIELD = "next"
RESULTS_FIELD = "results"


def _get_secret(secret_name: str, project_id: str) -> str:
    client = sm.SecretManagerServiceClient()
    secret_path = f"projects/{project_id}/secrets/{secret_name}/versions/latest"
    resp = client.access_secret_version(name=secret_path)
    return resp.payload.data.decode("utf-8")


def _write_to_gcs(bucket_name: str, object_path: str, data: bytes):
    storage_client = storage.Client()
    bucket = storage_client.bucket(bucket_name)
    blob = bucket.blob(object_path)
    blob.upload_from_string(data)
    print(f"Uploaded {len(data)} bytes to gs://{bucket_name}/{object_path}")


def _flatten_gcs_path(gcs_path: str):
    if not gcs_path.startswith("gs://"):
        raise ValueError("gcs_path must start with 'gs://'")
    parts = gcs_path[5:].split("/", 1)
    bucket = parts[0]
    prefix = parts[1] if len(parts) > 1 else ""
    return bucket, prefix.rstrip("/") + "/"


def _fetch_paginated(endpoint: str, headers: dict, params: dict) -> list:
    all_records = []
    url = endpoint
    while url:
        resp = requests.get(url, headers=headers, params=params, timeout=60)
        resp.raise_for_status()
        payload = resp.json()
        records = payload.get(RESULTS_FIELD, [])
        all_records.extend(records)
        next_url = payload.get(NEXT_PAGE_FIELD)
        if isinstance(next_url, str) and next_url:
            url = next_url
            params = {}
        else:
            url = None
        time.sleep(0.1)
    return all_records


@functions_framework.http
def ingest_handler(request):
    try:
        table = request.args.get("table")
        gcs_path = request.args.get("gcs_path")
        client_id = request.args.get("client_id")
        secret_key = request.args.get("secret_key")
        columns = request.args.get("columns")
        api_endpoint = request.args.get("api_endpoint")

        if not all([table, gcs_path, client_id, secret_key, api_endpoint]):
            return ("Missing required parameters: table, gcs_path, client_id, secret_key, api_endpoint", 400)

        project_id = google.auth.default()[1]

        client_secret = _get_secret(secret_key, project_id)

        basic_token = base64.b64encode(f"{client_id}:{client_secret}".encode()).decode()
        headers = {
            "Authorization": f"Basic {basic_token}",
            "Accept": "application/json",
        }

        params = {SIZE_PARAM: PAGE_SIZE}

        records = _fetch_paginated(api_endpoint, headers, params)

        if columns:
            columns_list = [col.strip() for col in columns.split(",")]
            filtered_records = []
            for rec in records:
                filtered_records.append({k: rec.get(k) for k in columns_list})
            records = filtered_records

        now = dt.datetime.utcnow().strftime("%Y%m%dT%H%M%SZ")
        filename = f"{table}_{now}.json"
        bucket, prefix = _flatten_gcs_path(gcs_path)
        object_path = prefix + filename

        _write_to_gcs(bucket, object_path, json.dumps(records, indent=2).encode())

        return (f"Ingested {len(records)} records from '{table}' to gs://{bucket}/{object_path}", 200)

    except requests.HTTPError as http_err:
        return (f"HTTP error during API call: {http_err}", 502)
    except Exception as e:
        return (f"Error: {str(e)}", 500)
