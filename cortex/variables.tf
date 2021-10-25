variable "objectstorage_container_name" {
  description = "Name of the object storage container name."
  type        = string
  default     = "cortex-lts"
}

variable "objectstorage_region" {
  description = "The region in which to create the container"
  type        = string
}

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

variable "cortex_all_in_one_count" {
  description = "The number of all_in_one node."
  type        = number
  default     = 0
}

variable "cortex_all_in_one_instance_flavor" {
  description = "The name of the instance to use for all_in_one node."
  type        = string
  default     = "s1-2"
}

variable "cortex_all_in_one_instance_name_template" {
  description = "Prefix to use for naming all_in_one node."
  type        = string
  default     = "cortex-all-in-one-%d"
}

variable "cortex_security_groups" {
  description = "List of security group's names."
  type        = list(string)
  default     = []
}


variable "cortex_alertmanager_count" {
  description = "The number of alertmanager node."
  type        = number
  default     = 0
}

variable "cortex_alertmanager_instance_flavor" {
  description = "The name of the instance to use for alertmanager node."
  type        = string
  default     = "s1-2"
}

variable "cortex_alertmanager_instance_name_template" {
  description = "Prefix to use for naming alertmanager node."
  type        = string
  default     = "cortex-alertmanager-%d"
}


variable "cortex_compactor_count" {
  description = "The number of compactor node."
  type        = number
  default     = 1
}

variable "cortex_compactor_instance_flavor" {
  description = "The name of the instance to use for compactor node."
  type        = string
  default     = "s1-2"
}

variable "cortex_compactor_instance_name_template" {
  description = "Prefix to use for naming compactor node."
  type        = string
  default     = "cortex-compactor-%d"
}


variable "cortex_configs_count" {
  description = "The number of configs node."
  type        = number
  default     = 0
}

variable "cortex_configs_instance_flavor" {
  description = "The name of the instance to use for configs node."
  type        = string
  default     = "s1-2"
}

variable "cortex_configs_instance_name_template" {
  description = "Prefix to use for naming configs node."
  type        = string
  default     = "cortex-configs-%d"
}


variable "cortex_distributor_count" {
  description = "The number of distributor node."
  type        = number
  default     = 1
}

variable "cortex_distributor_instance_flavor" {
  description = "The name of the instance to use for distributor node."
  type        = string
  default     = "s1-2"
}

variable "cortex_distributor_instance_name_template" {
  description = "Prefix to use for naming distributor node."
  type        = string
  default     = "cortex-distributor-%d"
}


variable "cortex_flusher_count" {
  description = "The number of flusher node."
  type        = number
  default     = 1
}

variable "cortex_flusher_instance_flavor" {
  description = "The name of the instance to use for flusher node."
  type        = string
  default     = "s1-2"
}

variable "cortex_flusher_instance_name_template" {
  description = "Prefix to use for naming flusher node."
  type        = string
  default     = "cortex-flusher-%d"
}


variable "cortex_ingester_count" {
  description = "The number of ingester node."
  type        = number
  default     = 1
}

variable "cortex_ingester_instance_flavor" {
  description = "The name of the instance to use for ingester node."
  type        = string
  default     = "s1-2"
}

variable "cortex_ingester_instance_name_template" {
  description = "Prefix to use for naming ingester node."
  type        = string
  default     = "cortex-ingester-%d"
}


variable "cortex_overrides_exporter_count" {
  description = "The number of overrides_exporter node."
  type        = number
  default     = 1
}

variable "cortex_overrides_exporter_instance_flavor" {
  description = "The name of the instance to use for overrides_exporter node."
  type        = string
  default     = "s1-2"
}

variable "cortex_overrides_exporter_instance_name_template" {
  description = "Prefix to use for naming overrides_exporter node."
  type        = string
  default     = "cortex-overrides-exporter-%d"
}


variable "cortex_purger_count" {
  description = "The number of purger node."
  type        = number
  default     = 1
}

variable "cortex_purger_instance_flavor" {
  description = "The name of the instance to use for purger node."
  type        = string
  default     = "s1-2"
}

variable "cortex_purger_instance_name_template" {
  description = "Prefix to use for naming purger node."
  type        = string
  default     = "cortex-purger-%d"
}


variable "cortex_querier_count" {
  description = "The number of querier node."
  type        = number
  default     = 1
}

variable "cortex_querier_instance_flavor" {
  description = "The name of the instance to use for querier node."
  type        = string
  default     = "s1-2"
}

variable "cortex_querier_instance_name_template" {
  description = "Prefix to use for naming querier node."
  type        = string
  default     = "cortex-querier-%d"
}


variable "cortex_query_frontend_count" {
  description = "The number of query_frontend node."
  type        = number
  default     = 1
}

variable "cortex_query_frontend_instance_flavor" {
  description = "The name of the instance to use for query_frontend node."
  type        = string
  default     = "s1-2"
}

variable "cortex_query_frontend_instance_name_template" {
  description = "Prefix to use for naming query_frontend node."
  type        = string
  default     = "cortex-query-frontend-%d"
}


variable "cortex_query_scheduler_count" {
  description = "The number of query_scheduler node."
  type        = number
  default     = 1
}

variable "cortex_query_scheduler_instance_flavor" {
  description = "The name of the instance to use for query_scheduler node."
  type        = string
  default     = "s1-2"
}

variable "cortex_query_scheduler_instance_name_template" {
  description = "Prefix to use for naming query_scheduler node."
  type        = string
  default     = "cortex-query-scheduler-%d"
}


variable "cortex_ruler_count" {
  description = "The number of ruler node."
  type        = number
  default     = 1
}

variable "cortex_ruler_instance_flavor" {
  description = "The name of the instance to use for ruler node."
  type        = string
  default     = "s1-2"
}

variable "cortex_ruler_instance_name_template" {
  description = "Prefix to use for naming ruler node."
  type        = string
  default     = "cortex-ruler-%d"
}

variable "cortex_store_gateway_count" {
  description = "The number of store_gateway node."
  type        = number
  default     = 1
}

variable "cortex_store_gateway_instance_flavor" {
  description = "The name of the instance to use for store_gateway node."
  type        = string
  default     = "s1-2"
}

variable "cortex_store_gateway_instance_name_template" {
  description = "Prefix to use for naming store_gateway node."
  type        = string
  default     = "cortex-store-gateway-%d"
}

variable "cortex_table_manager_count" {
  description = "The number of table_manager node."
  type        = number
  default     = 1
}

variable "cortex_table_manager_instance_flavor" {
  description = "The name of the instance to use for table_manager node."
  type        = string
  default     = "s1-2"
}

variable "cortex_table_manager_instance_name_template" {
  description = "Prefix to use for naming table_manager node."
  type        = string
  default     = "cortex-table-manager-%d"
}
