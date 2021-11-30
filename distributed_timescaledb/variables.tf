variable "postgresql_instance_flavor" {
  description = "The name of the instance to use for the postgresql servers."
  type        = string
  default     = "s1-2"
}

variable "lb_instance_flavor" {
  description = "The name of the instance to use for the lb servers."
  type        = string
  default     = "s1-2"
}

variable "node_per_patroni_cluster" {
  description = "The number of nodes in patroni cluster."
  type        = number
  default     = 3
}

variable "lb_per_patroni_cluster" {
  description = "The number of lbs in patroni cluster."
  type        = number
  default     = 0
}
