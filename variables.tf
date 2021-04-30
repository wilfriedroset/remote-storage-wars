variable "cloud" {}

variable "instance_image" {
  description = "The name of image to use for the server."
  type        = string
  # This requires to build the image with packer first.
  default = "Debian 10 - TSDB Infra - generic"
}

variable "postgresql_instance_flavor" {
  description = "The name of the instance to use for the postgresql servers."
  type        = string
  default     = "s1-2"
}

variable "tsbs_instance_flavor" {
  description = "The name of the instance to use for the tsbs servers."
  type        = string
  default     = "s1-2"
}

variable "prometheus_instance_flavor" {
  description = "The name of the instance to use for the prometheus servers."
  type        = string
  default     = "s1-2"
}

variable "vminsert_instance_flavor" {
  description = "The name of the instance to use for the vminsert servers."
  type        = string
  default     = "s1-2"
}

variable "vmselect_instance_flavor" {
  description = "The name of the instance to use for the vmselect servers."
  type        = string
  default     = "s1-2"
}

variable "vmstorage_instance_flavor" {
  description = "The name of the instance to use for the vmstorage servers."
  type        = string
  default     = "s1-2"
}

variable "promscale_instance_flavor" {
  description = "The name of the instance to use for the promscale servers."
  type        = string
  default     = "s1-2"
}

variable "lb_instance_flavor" {
  description = "The name of the instance to use for the lb servers."
  type        = string
  default     = "s1-2"
}

variable "consul_instance_flavor" {
  description = "The name of the instance to use for the consul servers."
  type        = string
  default     = "s1-2"
}

variable "etcd_instance_flavor" {
  description = "The name of the instance to use for the etcd servers."
  type        = string
  default     = "s1-2"
}

variable "grafana_instance_flavor" {
  description = "The name of the instance to use for the grafana servers."
  type        = string
  default     = "s1-2"
}

variable "node_per_patroni_cluster" {
  description = "The number of nodes in patroni cluster."
  type        = number
  default     = 3
}

variable "node_vmstorage" {
  description = "The number of victoria metric's storage node."
  type        = number
  default     = 6
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

variable "prometheus_count" {
  description = "The number of prometheus instance."
  type        = number
  default     = 1
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
  default     = 1
}


variable "m3_dbnode_count" {
  description = "The number of m3 dbnode instance."
  type        = number
  default     = 3
}

variable "m3_coordinator_count" {
  description = "The number of m3 coordinator instance."
  type        = number
  default     = 1
}

variable "m3_dbnode_instance_flavor" {
  description = "The name of the instance to use for the m3_dbnode servers."
  type        = string
  default     = "s1-2"
}

variable "m3_coordinator_instance_flavor" {
  description = "The name of the instance to use for the m3_coordinator servers."
  type        = string
  default     = "s1-2"
}

variable "domain_name" {
  description = "The name of the dns zone to use for dns entries."
  type        = string
  default     = ""
}

variable "ovh_endpoint" {
  description = "The name of the API endpoint to use."
  type        = string
  default     = "ovh-eu"
}

# Network configuration

variable "public_network" {
  description = "The name of the public network to use for servers."
  type        = string
  default     = "Ext-Net"
}

variable "private_network" {
  description = "Private network to create and use for servers."
  type = object({
    name     = string
    ip_range = string
  })
  default = {
    name     = "Remote-Storage-War"
    ip_range = "10.94.1.0/24"
  }
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
