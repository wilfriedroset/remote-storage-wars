variable "instance_image" {
  description = "The name of image to use for the server."
  type        = string
  default     = "Debian 10"
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

variable "userdata_path" {
  description = "Path of the userdata file to user."
  type        = string
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

# Load balancing

variable "lb_instance_flavor" {
  description = "The name of the instance to use lb."
  type        = string
  default     = "s1-2"
}

# Insert component

variable "vminsert_node_count" {
  description = "Number of insert node in the cluster"
  type        = number
  default     = 3
}

variable "vminsert_lb_count" {
  description = "Number of lb dedicated to insert node"
  type        = number
  default     = 1
}

variable "vminsert_node_instance_name_template" {
  description = "Prefix to use for naming insert node."
  type        = string
  default     = "vminsert-node-%d"
}

variable "vminsert_lb_instance_name_template" {
  description = "Prefix to use for naming insert lb."
  type        = string
  default     = "vminsert-lb-%d"
}

variable "vminsert_instance_flavor" {
  description = "The name of the instance to use for vminsert."
  type        = string
  default     = "s1-2"
}

variable "vminsert_lb_security_groups" {
  description = "List of security group's names for lb dedicated to insert node."
  type        = list(string)
  default     = []
}

variable "vminsert_node_security_groups" {
  description = "List of security group's names for insert nodes."
  type        = list(string)
  default     = []
}

# Select component

variable "vmselect_node_count" {
  description = "Number of select node in the cluster"
  type        = number
  default     = 3
}

variable "vmselect_lb_count" {
  description = "Number of lb dedicated to select node"
  type        = number
  default     = 1
}

variable "vmselect_node_instance_name_template" {
  description = "Prefix to use for naming select node."
  type        = string
  default     = "vmselect-node-%d"
}

variable "vmselect_lb_instance_name_template" {
  description = "Prefix to use for naming select lb."
  type        = string
  default     = "vmselect-lb-%d"
}

variable "vmselect_instance_flavor" {
  description = "The name of the instance to use for vmselect."
  type        = string
  default     = "s1-2"
}

variable "vmselect_lb_security_groups" {
  description = "List of security group's names for lb dedicated to select node."
  type        = list(string)
  default     = []
}

variable "vmselect_node_security_groups" {
  description = "List of security group's names for select nodes."
  type        = list(string)
  default     = []
}

# Storage component

variable "vmstorage_node_count" {
  description = "Number of storage node in the cluster"
  type        = number
  default     = 3
}

variable "vmstorage_node_instance_name_template" {
  description = "Prefix to use for naming storage node."
  type        = string
  default     = "vmstorage-node-%d"
}

variable "vmstorage_instance_flavor" {
  description = "The name of the instance to use for vmstorage."
  type        = string
  default     = "s1-2"
}

variable "vmstorage_node_security_groups" {
  description = "List of security group's names for storage nodes."
  type        = list(string)
  default     = []
}