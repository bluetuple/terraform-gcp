# create 1 control plane

# get all visible zones
data "google_compute_zones" "available_zones" {}

#control plane
resource "google_compute_instance" "control-plane" {
  depends_on = [
    google_compute_subnetwork.sn-nodes
  ]
  name         = var.k8_master_name
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
  metadata_startup_script = file("startup-master.sh")
}

