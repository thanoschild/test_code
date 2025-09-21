import os
import requests
from urllib.parse import urljoin

def main():
    payload = {
        "issue_number": os.environ["ISSUE_NUMBER"],
        "title": os.environ["ISSUE_TITLE"],
        "body": os.environ.get("ISSUE_BODY", ""),
        "repo_name": os.environ["REPO_NAME"],
    }

    cloud_run_url = os.environ["CLOUD_RUN_URL"]
    github_issue_endpoint = urljoin(cloud_run_url.rstrip("/") + "/", "api/v1/issues/github")

    response = requests.post(github_issue_endpoint, json=payload)
    print("Cloud Run response:", response.status_code, response.text)
    response.raise_for_status()

if __name__ == "__main__":
    main()
