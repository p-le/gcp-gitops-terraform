variable "env" {
  type = string
  description = "Target Env"
}

variable "subnet" {
  type = string
  description = "Target Subnet"
}

variable "zone" {
  type = string
  description = "Target Zone"
  default = "us-central1-a"
}

variable "os" {
  type = string
  description = "Target OS"
  default = "ubuntu-os-cloud/ubuntu-2004-lts"
}

variable "machine_type" {
  type = string
  description = "Target Machine Type"
  default = "e2-micro"
}
