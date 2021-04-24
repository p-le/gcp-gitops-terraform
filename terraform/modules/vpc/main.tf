locals {
  ip = "192.168.${var.env == "dev" ? 10 : 20}.0"
}

resource "google_compute_network" "vpc_network" {
  name = var.env
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet_01" {
  name          = "${var.env}-subnet-01"
  ip_cidr_range = "${local.ip}/24"
  region        = var.region
  network       = google_compute_network.vpc_network.id
}
