variable "cloud" {}

variable "instance_image" {
  default = "Debian 10"
}

variable "instance_flavor" {
  default = "s1-2"
}

variable "domain_name" {}

variable "ovh_endpoint" {
  default = "ovh-eu"
}

# Network configuration

variable "public_network" {
  default = "Ext-Net"
}

variable "private_network" {}

variable "ingress" {}

#  SSH Config

variable "ssh_remote_user" {
  default = "debian"
}

variable "ssh_key_name" {}

variable "ssh_key" {}
