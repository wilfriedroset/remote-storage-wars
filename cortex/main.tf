module "cortex" {
  source = "../modules/terraform-ovh-cortex"

  userdata_path = "../userdata.yml"
  ssh           = var.ssh

  instance_image = var.instance_image

  domain_name     = var.domain_name
  public_network  = var.public_network
  private_network = var.private_network.name

  objectstorage_region         = var.objectstorage_region
  objectstorage_container_name = var.objectstorage_container_name

  lb_instance_flavor = var.lb_instance_flavor
  lb_count           = var.lb_count
  lb_security_groups = ["ssh_security_group"]

  cortex_security_groups = ["ssh_security_group", "cortex_ui_security_group"]

  all_in_one_count                  = var.cortex_all_in_one_count
  all_in_one_instance_flavor        = var.cortex_all_in_one_instance_flavor
  all_in_one_instance_name_template = var.cortex_all_in_one_instance_name_template

  alertmanager_count                  = var.cortex_alertmanager_count
  alertmanager_instance_flavor        = var.cortex_alertmanager_instance_flavor
  alertmanager_instance_name_template = var.cortex_alertmanager_instance_name_template


  compactor_count                  = var.cortex_compactor_count
  compactor_instance_flavor        = var.cortex_compactor_instance_flavor
  compactor_instance_name_template = var.cortex_compactor_instance_name_template


  configs_count                  = var.cortex_configs_count
  configs_instance_flavor        = var.cortex_configs_instance_flavor
  configs_instance_name_template = var.cortex_configs_instance_name_template


  distributor_count                  = var.cortex_distributor_count
  distributor_instance_flavor        = var.cortex_distributor_instance_flavor
  distributor_instance_name_template = var.cortex_distributor_instance_name_template


  flusher_count                  = var.cortex_flusher_count
  flusher_instance_flavor        = var.cortex_flusher_instance_flavor
  flusher_instance_name_template = var.cortex_flusher_instance_name_template


  ingester_count                  = var.cortex_ingester_count
  ingester_instance_flavor        = var.cortex_ingester_instance_flavor
  ingester_instance_name_template = var.cortex_ingester_instance_name_template


  overrides_exporter_count                  = var.cortex_overrides_exporter_count
  overrides_exporter_instance_flavor        = var.cortex_overrides_exporter_instance_flavor
  overrides_exporter_instance_name_template = var.cortex_overrides_exporter_instance_name_template


  purger_count                  = var.cortex_purger_count
  purger_instance_flavor        = var.cortex_purger_instance_flavor
  purger_instance_name_template = var.cortex_purger_instance_name_template


  querier_count                  = var.cortex_querier_count
  querier_instance_flavor        = var.cortex_querier_instance_flavor
  querier_instance_name_template = var.cortex_querier_instance_name_template


  query_frontend_count                  = var.cortex_query_frontend_count
  query_frontend_instance_flavor        = var.cortex_query_frontend_instance_flavor
  query_frontend_instance_name_template = var.cortex_query_frontend_instance_name_template


  query_scheduler_count                  = var.cortex_query_scheduler_count
  query_scheduler_instance_flavor        = var.cortex_query_scheduler_instance_flavor
  query_scheduler_instance_name_template = var.cortex_query_scheduler_instance_name_template


  ruler_count                  = var.cortex_ruler_count
  ruler_instance_flavor        = var.cortex_ruler_instance_flavor
  ruler_instance_name_template = var.cortex_ruler_instance_name_template


  store_gateway_count                  = var.cortex_store_gateway_count
  store_gateway_instance_flavor        = var.cortex_store_gateway_instance_flavor
  store_gateway_instance_name_template = var.cortex_store_gateway_instance_name_template


  table_manager_count                  = var.cortex_table_manager_count
  table_manager_instance_flavor        = var.cortex_table_manager_instance_flavor
  table_manager_instance_name_template = var.cortex_table_manager_instance_name_template
}
