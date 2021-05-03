variable "prometheus_instance_flavor" {
  description = "The name of the instance to use for the prometheus servers."
  type        = string
  default     = "s1-2"
}

variable "prometheus_count" {
  description = "The number of prometheus instance."
  type        = number
  default     = 1
}
