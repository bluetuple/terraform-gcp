# Terraform modules for setting up an unmanaged kubernetes cluster

# specifiy GCP as provider
provider "google" {
  project = var.project
  region  = var.region
}

