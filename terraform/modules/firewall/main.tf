resource "google_compute_firewall" "allow_http" {
  name    = "${var.env}-allow-http"
  network = var.network

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  target_tags   = ["http-server"]
  source_ranges = ["0.0.0.0/0"]
}

# Allow IAP to connect to GCE instances
resource "google_compute_firewall" "allow_cloud_iap" {
  name    = "${var.env}-allow-cloud-iap"
  network = var.network

  allow {
    protocol = "tcp"
    ports    = ["3389", "22"]
  }

  source_ranges = ["35.235.240.0/20"]
}
