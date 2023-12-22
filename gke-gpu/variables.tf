variable "terraform_service_account" {
  type        = string
  description = "email adress of the service account used for terraform"

}

variable "project_id" {
  type        = string
  description = "ID of the project in scope"
}

variable "region" {
  type        = string
  description = "default region/zone. we will provide zone"
}

variable "zone" {
  type        = string
  description = " compute zone for the given region"
}

variable "cluster_name" {
  type        = string
  description = "k8s cluster name"
}

variable "gpu_type" {
  type        = string
  description = "required gpu type out of these: nvidia-tesla-k80, nvidia-tesla-p100, nvidia-tesla-p4, nvidia-tesla-v100, nvidia-tesla-t4, nvidia-tesla-a100, nvidia-a100-80gb, nvidia-l4"
}

variable "gpu_driver_version" {
  type        = string
  description = "one of INSTALLATION_DISABLED, DEFAULT, LATEST"
}

