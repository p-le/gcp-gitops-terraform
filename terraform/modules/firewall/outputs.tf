output "firewall_rules" {
  value = [
    google_compute_firewall.allow_http.name,
    google_compute_firewall.allow_cloud_iap.name
  ]
}
