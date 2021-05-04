resource "openstack_networking_secgroup_v2" "ssh_security_group" {
  name        = "ssh_security_group"
  description = "ssh security group"
}

resource "openstack_networking_secgroup_rule_v2" "ssh" {
  for_each          = toset(var.ssh_ingress)
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = each.value
  security_group_id = openstack_networking_secgroup_v2.ssh_security_group.id
}
