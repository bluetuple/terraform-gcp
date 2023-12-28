# standard variables

variable "project" {
  description = "default project"
  type        = string

}

variable "region" {
  description = " default region"
  type        = string
}


variable "k8_vpc_name" {
  description = "name of main vpc for k8"
  type        = string
}

variable "k8_vpc_sn_cidr" {
  description = " address range for sunbet main vpc"
  type        = string
}

variable "k8_vpc_sn_name" {
  description = "name for nodes subnet"
  type        = string
}

variable "k8_master_name" {
  description = "Name of master node"
  type        = string
}

# count worker nodes
variable "num_nodes" {
  description = "count worker nodes, max 4"
  type        = number
  validation {
    condition     = var.num_nodes <= 4
    error_message = "The input number must be 4 or smaller."
  }
}


# own ip to limit ssh attack vecor (temp - may be changed later)
variable "my_ip" {
  description = "Own extern IP - get with 'curl ipinfo.io'"
  type        = string

}

variable k8_router {
  type = string
  description = "Name of the router for ext conn"
}

variable k8_router_nat {
  type = string
  description = "Name on NAT router"
}