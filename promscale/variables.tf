variable "promscale_instance_flavor" {
  description = "The name of the instance to use for the promscale servers."
  type        = string
  default     = "s1-2"
}

variable "promscale_count" {
  description = "The number of promscale instance."
  type        = number
  default     = 1
}
