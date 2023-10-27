resource "google_compute_instance" "my_vm" {
  provider     = google.dst
  name         = var.name
  machine_type = var.machine_type
  # zone         = "infered"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    network    = var.network
    subnetwork = var.subnet

    access_config {
      // Ephemeral public IP
    }
  }

  service_account {
    email = var.sa_email
    scopes = ["cloud-platform"]
  }

  allow_stopping_for_update = true
}