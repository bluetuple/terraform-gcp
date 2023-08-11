# main tf
# specifiy gcp as pprovider

provider "google" {

  impersonate_service_account = "${var.sa_account}@${var.project}.iam.gserviceaccount.com"
}



#settinmg remote state
terraform {
  required_version = "~>1.5.0"
  backend "gcs" {}
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~>4.77.0"
    }
  }
}