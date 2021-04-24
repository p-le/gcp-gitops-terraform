Objective: Implementing GitOps with GCP

# Requirements
- Setup gcloud SDK + gsutil
- Manually create a Service Account for provisioning resources by Terraform
    - Grant required IAM Role to this Service Account
    - Generate JSON Key and upload to a GCS Bucket
- Manually Setup GitHub App Trigger through Google Cloud Build (https://github.com/marketplace/google-cloud-build)
    - Select target repository instead of All repositories for controling cost
    - Select target GCP Project ID
    - Setup Push Trigger

# How to
- Configure GitHub Apps
https://github.com/settings/installations
