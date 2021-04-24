terraform {
  backend "gcs" {
    bucket = "phu-le-terraform-state"
    prefix = "iam"
  }
}
