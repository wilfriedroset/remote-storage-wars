variable "dbnode_security_groups" {
  description = "List of security group's name for dbnode servers"
  type        = list(string)
  default     = []
}

variable "coordinator_security_groups" {
  description = "List of security group's name for coordinator servers"
  type        = list(string)
  default     = []
}

variable "dbnode_count" {
  description = "Number of node in the cluster"
  type        = number
  default     = 3
}

variable "coordinator_count" {
  description = "Number of coordinator in the cluster"
  type        = number
  default     = 1
}

variable "instance_image" {
  description = "The name of image to use for the server."
  type        = string
  default     = "Debian 10"
}

variable "dbnode_instance_flavor" {
  description = "The name of the instance to use dbnode."
  type        = string
  default     = "s1-2"
}

variable "coordinator_instance_flavor" {
  description = "The name of the instance to use coordinator."
  type        = string
  default     = "s1-2"
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

variable "userdata_path" {
  description = "Path of the userdata file to user."
  type        = string
}

variable "dbnode_instance_name_template" {
  description = "Prefix to use for naming the instance."
  type        = string
  default     = "m3-dbnode-%d"
}

variable "coordinator_instance_name_template" {
  description = "Prefix to use for naming the instance."
  type        = string
  default     = "m3-coordinator-%d"
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
