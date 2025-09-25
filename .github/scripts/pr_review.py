import os
import requests
from urllib.parse import urljoin

def main():
    payload = {
        "pr_number": os.environ["PR_NUMBER"],
        "repo": os.environ["REPO_NAME"],
        "head_branch": os.environ["PR_BRANCH"],
        "target_branch": os.environ["PR_BASE_BRANCH"],
        "reviewer": os.environ["REVIEWER"],
        "review_state": os.environ["REVIEW_STATE"],
        "review_body": os.environ.get("REVIEW_BODY", ""),
        "pr_url": os.environ["PR_URL"],
    }

    cloud_run_url = os.environ["CLOUD_RUN_URL"]
    print("cloud run url: " + cloud_run_url)
    github_pr_review_endpoint = urljoin(cloud_run_url.rstrip("/") + "/", "api/v1/github/pr-review")

    response = requests.post(github_pr_review_endpoint, json=payload)
    print("Cloud Run response:", response.status_code, response.text)
    response.raise_for_status()

if __name__ == "__main__":
    main()
