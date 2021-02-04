variable "cloud" {}

variable "instance_image" {
  description = "The name of image to use for the server."
  type        = string
  default     = "Debian 10"
}

variable "instance_flavor" {
  description = "The name of the instance to use for the servers."
  type        = string
  default     = "s1-2"
  validation {
    condition = contains([
      "b2-7", "b2-15", "b2-30", "b2-60", "b2-120",
      "c2-7", "c2-15", "c2-30", "c2-60", "c2-120",
      "i1-45", "i1-90", "i1-180",
      "r2-15", "r2-30", "r2-60", "r2-120", "r2-240",
      "s1-2", "s1-4", "s1-8",
    ], lower(var.instance_flavor))
    error_message = "Unsupported instance flavor specified."
  }
}

variable "postgresql_instance_flavor" {
  description = "The name of the instance to use for the postgresql servers."
  type        = string
  default     = "s1-2"
  validation {
    condition = contains([
      "b2-7", "b2-15", "b2-30", "b2-60", "b2-120",
      "c2-7", "c2-15", "c2-30", "c2-60", "c2-120",
      "i1-45", "i1-90", "i1-180",
      "r2-15", "r2-30", "r2-60", "r2-120", "r2-240",
      "s1-2", "s1-4", "s1-8",
    ], lower(var.postgresql_instance_flavor))
    error_message = "Unsupported postgresql instance flavor specified."
  }
}

variable "node_per_patroni_cluster" {
  description = "The number of nodes in patroni cluster."
  type        = number
  default     = 3
}

variable "node_vmstorage" {
  description = "The number of victoria metric's storage node."
  type        = number
  default     = 3
}

variable "node_vminsert" {
  description = "The number of victoria metric's insert node."
  type        = number
  default     = 3
}

variable "node_vmselect" {
  description = "The number of victoria metric's select node."
  type        = number
  default     = 3
}

variable "tsbs_count" {
  description = "The number of tsbs instance."
  type        = number
  default     = 1
}

variable "promscale_count" {
  description = "The number of promscale instance."
  type        = number
  default     = 1
}

variable "lb_count" {
  description = "The number of load balancer."
  type        = number
  default     = 2
}

variable "domain_name" {
  description = "The name of the dns zone to use for dns entries."
  type        = string
}

variable "ovh_endpoint" {
  description = "The name of the API endpoint to use."
  type        = string
  default     = "ovh-eu"
  validation {
    condition = contains([
      "ovh-eu", "ovh-ca", "ovh-us", "soyoustart-eu", "soyoustart-ca", "kimsufi-ca", "kimsufi-eu", "runabove-ca"
    ], lower(var.ovh_endpoint))
    error_message = "Unsupported ovh endpoint specified."
  }
}

# Network configuration

variable "public_network" {
  description = "The name of the public network to use for servers."
  type        = string
  default     = "Ext-Net"
}

variable "private_network" {
  description = "The name of the private network to create and use for servers."
  type        = string
}

variable "ssh_ingress" {
  description = "The CIDRs to allow for ssh incoming connexion."
  type        = list(string)
  default     = []
}

variable "ui_ingress" {
  description = "The CIDRs to allow for UI incoming connexion."
  type        = list(string)
  default     = []
}

#  SSH Config

variable "ssh" {
  description = "The ssh information to log in the remote machine."
  type = object({
    username        = string
    public_key_name = string
    public_key      = string
  })
  default = {
    username        = "debian"
    public_key_name = null
    public_key      = null
  }
}
