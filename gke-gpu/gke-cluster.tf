## kubernetes cluster
resource "google_container_cluster" "gpu_cluster" {
  name           = var.cluster_name
  location       = var.region
  node_locations = [var.zone]

  deletion_protection = false
  initial_node_count  = 1

  timeouts {
    create = "20m"
    update = "30m"
  }

  lifecycle {
    ignore_changes = [master_auth, network]
  }

}