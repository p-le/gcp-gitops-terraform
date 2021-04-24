locals {
  env = "dev"
}

provider "google" {
  project = var.project
}

module "vpc" {
  source  = "../../modules/vpc"
  env     = local.env
}

module "http_server" {
  source  = "../../modules/http_server"
  subnet  = module.vpc.subnet
  env     = local.env
}

module "firewall" {
  source  = "../../modules/firewall"
  network = module.vpc.network
  env     = local.env
}
