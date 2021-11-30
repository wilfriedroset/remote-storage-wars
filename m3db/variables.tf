variable "m3_dbnode_count" {
  description = "The number of m3 dbnode instance."
  type        = number
  default     = 0
}

variable "m3_coordinator_count" {
  description = "The number of m3 coordinator instance."
  type        = number
  default     = 0
}

variable "m3_query_count" {
  description = "The number of m3 query instance."
  type        = number
  default     = 0
}

variable "m3_aggregator_count" {
  description = "The number of m3 aggregator instance."
  type        = number
  default     = 0
}

variable "m3_lb_count" {
  description = "The number of m3 lb instance."
  type        = number
  default     = 0
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

variable "m3_query_instance_flavor" {
  description = "The name of the instance to use for the m3_query servers."
  type        = string
  default     = "s1-2"
}

variable "m3_aggregator_instance_flavor" {
  description = "The name of the instance to use for the m3_aggregator servers."
  type        = string
  default     = "s1-2"
}

variable "m3_lb_instance_flavor" {
  description = "The name of the instance to use for the m3_lb servers."
  type        = string
  default     = "s1-2"
}
