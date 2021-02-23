output "patroni_servers" {
  value = openstack_compute_instance_v2.patroni_servers[*].network[0].fixed_ip_v4
}

output "patroni_lb" {
  value = openstack_compute_instance_v2.patroni_lb[*].network[0].fixed_ip_v4
}
