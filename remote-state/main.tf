# main.tf
# This file contains the main Terraform configuration.

# Specify Google Cloud Platform as the provider.
provider "google" {
  # Impersonate a specific service account to make API calls on behalf of.
  impersonate_service_account = "${var.sa_account}@${var.project}.iam.gserviceaccount.com"
}

# Configuration for Terraform's behavior.
terraform {
  # Specify the version of Terraform required to apply this configuration.
  required_version = "~>1.5.0"

  # Use Google Cloud Storage (GCS) as the backend for remote state management.
  backend "gcs" {}

  # Define required providers and their versions.
  required_providers {
    google = {
      # Source repository for the GCP provider.
      source  = "hashicorp/google"
      
      # Specify the version of the GCP provider.
      version = "~>4.77.0"
    }
  }
}