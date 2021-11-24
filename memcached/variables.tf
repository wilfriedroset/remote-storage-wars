variable "memcached_instance_flavor" {
  description = "The name of the instance to use for the memcached servers."
  type        = string
  default     = "s1-2"
}

variable "memcached_count" {
  description = "The number of memcached instance."
  type        = number
  default     = 1
}
