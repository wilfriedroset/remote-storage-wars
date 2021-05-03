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
