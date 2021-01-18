variable "cloud" {}

variable "instance_image" {
  default = "Debian 10"
}

variable "instance_flavor" {
  default = "s1-2"
}

variable "postgresql_instance_flavor" {
  default = "s1-2"
}

variable "node_per_patroni_cluster" {
  default = 3
}

variable "node_vmstorage" {
  default = 3
}

variable "node_vminsert" {
  default = 3
}

variable "node_vmselect" {
  default = 3
}

variable "promscale_count" {
  default = 1
}

variable "lb_count" {
  default = 2
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
