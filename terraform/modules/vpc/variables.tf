variable "env" {
  type = string
  description = "Target Env (Dev or Prod)"
}

variable "region" {
  type = string
  description = "Target Region"
  default = "us-central1"
}

