# Vaiable definitons will go here
# In other files referneced as var.<variablename>

variable "region" {
  type        = string
  description = "Default Region from env"

}

variable "project" {
  type        = string
  description = "Default project_name from env"
}

variable "sa_account" {
  type        = string
  description = "Storage account name from env"
}


variable "rs_bucket" {
  type        = string
  description = "Name of bucked used to store remote tf state"
}
