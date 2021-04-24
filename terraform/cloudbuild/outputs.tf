output "triggers" {
  value = [
    google_cloudbuild_trigger.gcp_gitops_terraform_push_trigger.name,
  ]
}
