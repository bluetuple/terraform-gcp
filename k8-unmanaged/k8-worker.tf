# create x vms for worker nodes

# get avsilable zones
#data "google_compute_zones" "available_zones" {}

# create count node instances
resource "google_compute_instance" "worker" {
  depends_on = [
    google_compute_subnetwork.sn-nodes
  ]
  count = var.num_nodes

  name         = "worker0${count.index + 1}"
  zone         = data.google_compute_zones.available_zones.names[0]
  machine_type = "e2-medium"

  tags = ["allow-ssh", "allow-internal", "allow-iap"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }

  network_interface {
    subnetwork = var.k8_vpc_sn_name

  }

  metadata_startup_script = file("startup-worker.sh")
}
