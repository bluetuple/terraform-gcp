terraform {
  required_providers {
    google = {
      version = "~>5.10.0"
    }
    kubernetes = {
      version = "~>2.20"
    }
    /*
    kubectl = {
      source  = "alekc/kubectl"
      version = ">= 2.0.0"
    }
*/
  }
}

