terraform {
  required_providers {
    google = {
      version = "~> 4.7.0"
    }
  }
}



terraform {

  backend "gcs" {
    bucket = "<bucket-name>"
    prefix = "<prefix>"

    impersonate_service_account = "<service-account-email>"

  }

}
