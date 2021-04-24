provider "google" {
  project = var.project
}

resource "google_service_account" "terraform_cloud_build" {
  account_id   = "terraform-cloud-build"
  display_name = "Terraform Cloud Build"
  description = "[Provisioned by Terraform] Service Account for Cloud Build running Terraform"
}

resource "google_project_iam_member" "terraform_cloud_build" {
  role    = "roles/editor"
  member  = "serviceAccount:${google_service_account.terraform_cloud_build.email}"
}
