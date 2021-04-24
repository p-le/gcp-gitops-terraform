output "network" {
  value = google_compute_network.vpc_network.id
}

output "subnet" {
  value = google_compute_subnetwork.subnet_01.id
}
