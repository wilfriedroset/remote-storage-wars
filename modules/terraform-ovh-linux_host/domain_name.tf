resource "ovh_domain_zone_record" "linuxhost" {
  count     = var.domain_name != "" ? 1 : 0
  subdomain = openstack_compute_instance_v2.linuxhost.name
  zone      = var.domain_name
  fieldtype = "A"
  ttl       = "60"
  target    = openstack_compute_instance_v2.linuxhost.access_ip_v4
}
