variable "promscale_instance_flavor" {
  description = "The name of the instance to use for the promscale servers."
  type        = string
  default     = "s1-2"
}

variable "promscale_node_count" {
  description = "The number of promscale instance."
  type        = number
  default     = 0
}

variable "promscale_lb_count" {
  description = "The number of promscale lb."
  type        = number
  default     = 0
}
