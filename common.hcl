#
# This file aims to store all variables shared betweed all child terraform plan.
# It will be used by terragrunt to generate common.tf in the root directory and
# the child directories (which are ignored in .gitignore)
#

variable "cloud" {
  description = "An entry in a clouds.yaml file"
}

variable "region_name" {
  description = "The region of the OpenStack cloud to use"
}

variable "ovh_endpoint" {
  description = "The name of the API endpoint to use."
  type        = string
  default     = "ovh-eu"
}

variable "domain_name" {
  description = "The name of the dns zone to use for dns entries."
  type        = string
  default     = ""
}

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

variable "ui_ingress" {
  description = "The CIDRs to allow for UI incoming connexion."
  type        = list(string)
  default     = []
}

variable "ssh_ingress" {
  description = "The CIDRs to allow for ssh incoming connexion."
  type        = list(string)
  default     = []
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

variable "instance_image" {
  description = "The name of image to use for the server."
  type        = string
  # This requires to build the image with packer first.
  default = "Debian 10 - TSDB Infra - generic"
}
