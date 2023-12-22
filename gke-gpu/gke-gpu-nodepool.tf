
resource "google_container_node_pool" "gpu_pool" {
  name       = "gpu-pool"
  location   = var.region
  cluster    = google_container_cluster.gpu_cluster.name
  node_count = 1


  management {
    auto_repair  = "true"
    auto_upgrade = "true"
  }

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/trace.append",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/servicecontrol",
    ]


    labels = {
      env     = "sandbox"
      project = var.project_id

    }

    guest_accelerator {
      type  = var.gpu_type
      count = 2
      gpu_driver_installation_config {
        gpu_driver_version = var.gpu_driver_version
      }

    }

    image_type   = "cos_containerd"
    machine_type = "g2-standard-24"
    tags         = ["gke-node", "sandbox", "${var.project_id}"]

    disk_size_gb = "50"
    disk_type    = "pd-balanced"

    shielded_instance_config {
      enable_secure_boot          = true
      enable_integrity_monitoring = true
    }


  }

  timeouts {
    create = "20m"
    update = "30m"
  }

}
