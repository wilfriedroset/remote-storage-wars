variable "tsbs_instance_flavor" {
  description = "The name of the instance to use for the tsbs servers."
  type        = string
  default     = "s1-2"
}

variable "tsbs_count" {
  description = "The number of tsbs instance."
  type        = number
  default     = 1
}
