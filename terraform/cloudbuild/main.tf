provider "google" {
  project = var.project
}

resource "google_cloudbuild_trigger" "gcp_gitops_terraform_push_trigger" {
  name = "gcp-gitops-terraform-pr-trigger"
  description = "Push trigger for Repository: https://github.com/p-le/gcp-gitops-terraform"

  github {
    owner = "p-le"
    name = "gcp-gitops-terraform"
    pull_request {
      branch = "^dev|prod$"
      comment_control = "COMMENTS_ENABLED"
    }
  }

  filename = "cloudbuild.yaml"
}
