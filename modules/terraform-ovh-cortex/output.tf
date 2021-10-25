output "all_in_one_domain_zone_record" {
  value = module.all_in_one[*].domain_zone_record
}

output "all_in_one_linuxhost" {
  value = module.all_in_one[*].linuxhost
}

output "alertmanager_domain_zone_record" {
  value = module.alertmanager[*].domain_zone_record
}

output "alertmanager_linuxhost" {
  value = module.alertmanager[*].linuxhost
}

output "compactor_domain_zone_record" {
  value = module.compactor[*].domain_zone_record
}

output "compactor_linuxhost" {
  value = module.compactor[*].linuxhost
}

output "configs_domain_zone_record" {
  value = module.configs[*].domain_zone_record
}

output "configs_linuxhost" {
  value = module.configs[*].linuxhost
}

output "distributor_domain_zone_record" {
  value = module.distributor[*].domain_zone_record
}

output "distributor_linuxhost" {
  value = module.distributor[*].linuxhost
}

output "flusher_domain_zone_record" {
  value = module.flusher[*].domain_zone_record
}

output "flusher_linuxhost" {
  value = module.flusher[*].linuxhost
}

output "ingester_domain_zone_record" {
  value = module.ingester[*].domain_zone_record
}

output "ingester_linuxhost" {
  value = module.ingester[*].linuxhost
}

output "overrides_exporter_domain_zone_record" {
  value = module.overrides_exporter[*].domain_zone_record
}

output "overrides_exporter_linuxhost" {
  value = module.overrides_exporter[*].linuxhost
}

output "purger_domain_zone_record" {
  value = module.purger[*].domain_zone_record
}

output "purger_linuxhost" {
  value = module.purger[*].linuxhost
}

output "querier_domain_zone_record" {
  value = module.querier[*].domain_zone_record
}

output "querier_linuxhost" {
  value = module.querier[*].linuxhost
}

output "query_frontend_domain_zone_record" {
  value = module.query_frontend[*].domain_zone_record
}

output "query_frontend_linuxhost" {
  value = module.query_frontend[*].linuxhost
}

output "query_scheduler_domain_zone_record" {
  value = module.query_scheduler[*].domain_zone_record
}

output "query_scheduler_linuxhost" {
  value = module.query_scheduler[*].linuxhost
}

output "ruler_domain_zone_record" {
  value = module.ruler[*].domain_zone_record
}

output "ruler_linuxhost" {
  value = module.ruler[*].linuxhost
}

output "store_gateway_domain_zone_record" {
  value = module.store_gateway[*].domain_zone_record
}

output "store_gateway_linuxhost" {
  value = module.store_gateway[*].linuxhost
}

output "table_manager_domain_zone_record" {
  value = module.table_manager[*].domain_zone_record
}

output "table_manager_linuxhost" {
  value = module.table_manager[*].linuxhost
}
