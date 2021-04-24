provider "google" {
  project = var.project
}

resource "google_cloudbuild_trigger" "gcp_gitops_terraform_push_trigger" {
  name = "gcp-gitops-terraform-push-trigger"
  description = "Push trigger for Repository: https://github.com/p-le/gcp-gitops-terraform"

  github {
    owner = "p-le"
    name = "https://github.com/p-le/gcp-gitops-terraform"
    push {
      branch = ".*"
    }
  }

  tags = [
    "github-default-push-trigger"
  ]

  filename = "cloudbuild.yaml"
}
