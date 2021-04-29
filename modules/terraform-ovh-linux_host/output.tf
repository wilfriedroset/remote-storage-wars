output "linuxhost" {
  value = openstack_compute_instance_v2.linuxhost.network[0].fixed_ip_v4
}

output "domain_zone_record" {
  value = var.domain_name != "" ? "${ovh_domain_zone_record.linuxhost[0].subdomain}.${ovh_domain_zone_record.linuxhost[0].zone}" : ""
}
