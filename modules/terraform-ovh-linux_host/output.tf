output "linuxhost" {
  value = openstack_compute_instance_v2.linuxhost.network[0].fixed_ip_v4
}
