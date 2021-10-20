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

# Load balancer

variable "lb_count" {
  description = "The number of load balancer"
  type        = number
  default     = 1
}

variable "lb_instance_name_template" {
  description = "Prefix to use for naming load balancer node."
  type        = string
  default     = "cortex-lb-%d"
}

variable "lb_instance_flavor" {
  description = "The name of the instance to use for load balancer."
  type        = string
  default     = "s1-2"
}

variable "lb_security_groups" {
  description = "List of security group's names for load balancer node."
  type        = list(string)
  default     = []
}

variable "objectstorage_container_name" {
  description = "Name of the object storage container name."
  type        = string
}

variable "objectstorage_region" {
  description = "The region in which to create the container"
  type        = string
}

variable "all_in_one_count" {
  description = "The number of all_in_one node."
  type        = number
  default     = 0
}

variable "all_in_one_instance_flavor" {
  description = "The name of the instance to use for all_in_one node."
  type        = string
  default     = "s1-2"
}

variable "all_in_one_instance_name_template" {
  description = "Prefix to use for naming all_in_one node."
  type        = string
  default     = "cortex-all-in-one-%d"
}

variable "cortex_security_groups" {
  description = "List of security group's names."
  type        = list(string)
  default     = []
}


variable "alertmanager_count" {
  description = "The number of alertmanager node."
  type        = number
  default     = 0
}

variable "alertmanager_instance_flavor" {
  description = "The name of the instance to use for alertmanager node."
  type        = string
  default     = "s1-2"
}

variable "alertmanager_instance_name_template" {
  description = "Prefix to use for naming alertmanager node."
  type        = string
  default     = "cortex-alertmanager-%d"
}


variable "compactor_count" {
  description = "The number of compactor node."
  type        = number
  default     = 1
}

variable "compactor_instance_flavor" {
  description = "The name of the instance to use for compactor node."
  type        = string
  default     = "s1-2"
}

variable "compactor_instance_name_template" {
  description = "Prefix to use for naming compactor node."
  type        = string
  default     = "cortex-compactor-%d"
}


variable "configs_count" {
  description = "The number of configs node."
  type        = number
  default     = 0
}

variable "configs_instance_flavor" {
  description = "The name of the instance to use for configs node."
  type        = string
  default     = "s1-2"
}

variable "configs_instance_name_template" {
  description = "Prefix to use for naming configs node."
  type        = string
  default     = "cortex-configs-%d"
}


variable "distributor_count" {
  description = "The number of distributor node."
  type        = number
  default     = 1
}

variable "distributor_instance_flavor" {
  description = "The name of the instance to use for distributor node."
  type        = string
  default     = "s1-2"
}

variable "distributor_instance_name_template" {
  description = "Prefix to use for naming distributor node."
  type        = string
  default     = "cortex-distributor-%d"
}


variable "flusher_count" {
  description = "The number of flusher node."
  type        = number
  default     = 1
}

variable "flusher_instance_flavor" {
  description = "The name of the instance to use for flusher node."
  type        = string
  default     = "s1-2"
}

variable "flusher_instance_name_template" {
  description = "Prefix to use for naming flusher node."
  type        = string
  default     = "cortex-flusher-%d"
}


variable "ingester_count" {
  description = "The number of ingester node."
  type        = number
  default     = 1
}

variable "ingester_instance_flavor" {
  description = "The name of the instance to use for ingester node."
  type        = string
  default     = "s1-2"
}

variable "ingester_instance_name_template" {
  description = "Prefix to use for naming ingester node."
  type        = string
  default     = "cortex-ingester-%d"
}


variable "overrides_exporter_count" {
  description = "The number of overrides_exporter node."
  type        = number
  default     = 1
}

variable "overrides_exporter_instance_flavor" {
  description = "The name of the instance to use for overrides_exporter node."
  type        = string
  default     = "s1-2"
}

variable "overrides_exporter_instance_name_template" {
  description = "Prefix to use for naming overrides_exporter node."
  type        = string
  default     = "cortex-overrides-exporter-%d"
}


variable "purger_count" {
  description = "The number of purger node."
  type        = number
  default     = 1
}

variable "purger_instance_flavor" {
  description = "The name of the instance to use for purger node."
  type        = string
  default     = "s1-2"
}

variable "purger_instance_name_template" {
  description = "Prefix to use for naming purger node."
  type        = string
  default     = "cortex-purger-%d"
}


variable "querier_count" {
  description = "The number of querier node."
  type        = number
  default     = 1
}

variable "querier_instance_flavor" {
  description = "The name of the instance to use for querier node."
  type        = string
  default     = "s1-2"
}

variable "querier_instance_name_template" {
  description = "Prefix to use for naming querier node."
  type        = string
  default     = "cortex-querier-%d"
}


variable "query_frontend_count" {
  description = "The number of query_frontend node."
  type        = number
  default     = 1
}

variable "query_frontend_instance_flavor" {
  description = "The name of the instance to use for query_frontend node."
  type        = string
  default     = "s1-2"
}

variable "query_frontend_instance_name_template" {
  description = "Prefix to use for naming query_frontend node."
  type        = string
  default     = "cortex-query-frontend-%d"
}


variable "query_scheduler_count" {
  description = "The number of query_scheduler node."
  type        = number
  default     = 1
}

variable "query_scheduler_instance_flavor" {
  description = "The name of the instance to use for query_scheduler node."
  type        = string
  default     = "s1-2"
}

variable "query_scheduler_instance_name_template" {
  description = "Prefix to use for naming query_scheduler node."
  type        = string
  default     = "cortex-query-scheduler-%d"
}


variable "ruler_count" {
  description = "The number of ruler node."
  type        = number
  default     = 1
}

variable "ruler_instance_flavor" {
  description = "The name of the instance to use for ruler node."
  type        = string
  default     = "s1-2"
}

variable "ruler_instance_name_template" {
  description = "Prefix to use for naming ruler node."
  type        = string
  default     = "cortex-ruler-%d"
}

variable "store_gateway_count" {
  description = "The number of store_gateway node."
  type        = number
  default     = 1
}

variable "store_gateway_instance_flavor" {
  description = "The name of the instance to use for store_gateway node."
  type        = string
  default     = "s1-2"
}

variable "store_gateway_instance_name_template" {
  description = "Prefix to use for naming store_gateway node."
  type        = string
  default     = "cortex-store-gateway-%d"
}

variable "table_manager_count" {
  description = "The number of table_manager node."
  type        = number
  default     = 1
}

variable "table_manager_instance_flavor" {
  description = "The name of the instance to use for table_manager node."
  type        = string
  default     = "s1-2"
}

variable "table_manager_instance_name_template" {
  description = "Prefix to use for naming table_manager node."
  type        = string
  default     = "cortex-table-manager-%d"
}
