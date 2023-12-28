# module for all network definitions


# create private kubernetes network
resource "google_compute_network" "vpc" {
  name                    = var.k8_vpc_name
  auto_create_subnetworks = false

}

# subnet for k8 nodes
resource "google_compute_subnetwork" "sn-nodes" {
  name          = var.k8_vpc_sn_name
  ip_cidr_range = var.k8_vpc_sn_cidr
  network       = google_compute_network.vpc.id
  region        = var.region

}



# initializing cloud nat
resource "google_compute_router" "k8_router" {
  name    = var.k8_router
  region  = var.region
  network = google_compute_network.vpc.id
}

resource "google_compute_router_nat" "router_nat" {
  name                               = var.k8._router_nat"
  router                             = google_compute_router.bt_router.name
  region                             = var.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  log_config {
    enable = true
    filter = "ALL"
  }
}


# identity aware proxy
resource "google_compute_firewall" "allow-iap" {
  name    = "allow-iap-rule"
  network = var.k8_vpc_name
  depends_on = [
    google_compute_network.vpc
  ]

  allow {
    protocol = "tcp"
  }
  target_tags   = ["allow-iap"]
  source_ranges = ["35.235.240.0/20"]
}






# allow ssh access from internet (temp)
resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh-rule"
  network = var.k8_vpc_name
  depends_on = [
    google_compute_network.vpc
  ]

  allow {
    ports    = ["22"]
    protocol = "tcp"
  }

  target_tags = ["allow-ssh"]
  priority    = 1100

  #source_ranges = ["0.0.0.0/0"]
  source_ranges = [var.my_ip]


}




# allow internal traffic

resource "google_compute_firewall" "allow_internal" {
  name    = "allow-icmp-rule"
  network = var.k8_vpc_name
  depends_on = [
    google_compute_network.vpc
  ]

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
  }

  allow {
    protocol = "udp"
  }
  target_tags = ["allow-internal"]
  priority    = 1110

  source_ranges = [var.k8_vpc_sn_cidr]


}

