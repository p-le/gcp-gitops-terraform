data "template_file" "startup_script" {
  template = file("${path.module}/startup_script.sh")
  vars = {
    environment = var.env
  }
}

resource "random_id" "id" {
  keepers = {
    # Generate a new id each time we switch these information
    startup_script  = data.template_file.startup_script.rendered
    os              = var.os
    machine_type    = var.machine_type
  }
  byte_length = 2
}

resource "google_compute_instance" "http_server" {
  zone         = var.zone
  name         = "${var.env}-apache2-${random_id.id.hex}"
  machine_type = random_id.id.keepers.machine_type

  metadata_startup_script = random_id.id.keepers.startup_script

  boot_disk {
    initialize_params {
      image = random_id.id.keepers.os
    }
  }

  network_interface {
    subnetwork = var.subnet

    access_config {
      # Include this section to give the VM an external ip address
    }
  }

  # Reference: https://cloud.google.com/compute/docs/instances/managing-instance-access
  metadata = {
    enable-oslogin = "TRUE"
  }

  # Apply the firewall rule to allow external IPs to access this instance
  tags = ["http-server", "https-server", "test"]
}
