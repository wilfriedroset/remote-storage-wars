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
