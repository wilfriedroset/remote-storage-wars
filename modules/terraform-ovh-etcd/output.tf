output "domain_zone_record" {
  value = module.etcd_server[*].domain_zone_record
}

output "linuxhost" {
  value = module.etcd_server[*].linuxhost
}
