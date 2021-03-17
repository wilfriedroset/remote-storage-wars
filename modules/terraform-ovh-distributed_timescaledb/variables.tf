variable "patroni_security_groups" {
  description = "List of security group's name for patroni servers"
  type        = list(string)
  default     = []
}

variable "lb_security_groups" {
  description = "List of security group's name for lb servers"
  type        = list(string)
  default     = []
}

variable "node_count" {
  description = "Number of node in the cluster"
  type        = number
  default     = 3
}

variable "lb_count" {
  description = "Number of lb in the cluster"
  type        = number
  default     = 1
}

variable "instance_image" {
  description = "The name of image to use for the server."
  type        = string
  default     = "Debian 10"
}

variable "patroni_instance_flavor" {
  description = "The name of the instance to use patroni."
  type        = string
  default     = "s1-2"
  validation {
    condition = contains([
      "b2-7", "b2-15", "b2-30", "b2-60", "b2-120",
      "c2-7", "c2-15", "c2-30", "c2-60", "c2-120",
      "i1-45", "i1-90", "i1-180",
      "r2-15", "r2-30", "r2-60", "r2-120", "r2-240",
      "s1-2", "s1-4", "s1-8",
    ], lower(var.patroni_instance_flavor))
    error_message = "Unsupported instance flavor specified."
  }
}

variable "lb_instance_flavor" {
  description = "The name of the instance to use lb."
  type        = string
  default     = "s1-2"
  validation {
    condition = contains([
      "b2-7", "b2-15", "b2-30", "b2-60", "b2-120",
      "c2-7", "c2-15", "c2-30", "c2-60", "c2-120",
      "i1-45", "i1-90", "i1-180",
      "r2-15", "r2-30", "r2-60", "r2-120", "r2-240",
      "s1-2", "s1-4", "s1-8",
    ], lower(var.lb_instance_flavor))
    error_message = "Unsupported instance flavor specified."
  }
}

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

variable "userdata" {
  description = "Path of the userdata file to user."
  type        = string
}

variable "access_node_cluster_name" {
  description = "Name of the access node cluster"
  type        = string
  default     = "timescaledb-access-node"
}

variable "data_node_cluster_name_template" {
  description = "Prefix to use for naming a shard of the data node cluster."
  type        = string
  default     = "timescaledb-data-node-shard-%d"
}

variable "shard_count" {
  description = "Number of shard within the cluster"
  type        = number
  default     = 3
}

variable "access_node_patroni_instance_name_template" {
  description = "Prefix to use for naming the instance of the access node cluster."
  type        = string
  default     = "patroni-an-node-%d"
}

variable "access_node_lb_instance_name_template" {
  description = "Prefix to use for naming the instance of the access node cluster."
  type        = string
  default     = "patroni-an-lb-%d"
}

variable "data_node_patroni_instance_name_template" {
  description = "Prefix to use for naming the instance of the data node cluster."
  type        = string
  default     = "patroni-dn-shard-%d-node-%%d"
}

variable "data_node_lb_instance_name_template" {
  description = "Prefix to use for naming the instance of the data node cluster."
  type        = string
  default     = "patroni-dn-shard-%d-lb-%%d"
}

variable "public_network" {
  description = "The name of the public network to use for servers."
  type        = string
  default     = "Ext-Net"
}

variable "private_network" {
  description = "The name of the private network to create and use for servers."
  type        = string
}

variable "domain_name" {
  description = "The name of the dns zone to use for dns entries."
  type        = string
  default     = null
}
