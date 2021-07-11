variable "host_count" {
  description = "Number of instance to deploy with the same specs"
  type        = number
  default     = 1
}

variable "instance_name" {
  description = "Host name of the instance"
  type        = string
}

variable "instance_image" {
  description = "The name of image to use for the server."
  type        = string
  default     = "Debian 10"
}

variable "instance_flavor" {
  description = "The name of the instance to use."
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

variable "security_groups" {
  description = "List of security group's name."
  type        = list(string)
  default     = []
}

variable "instance_metadata" {
  description = "Metadata to apply on the instance."
  type        = map(any)
  default     = {}
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
