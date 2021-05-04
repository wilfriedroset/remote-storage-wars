resource "openstack_networking_secgroup_v2" "consul_ui_security_group" {
  name        = "consul_ui_security_group"
  description = "consul UI security group"
}

resource "openstack_networking_secgroup_rule_v2" "consul" {
  for_each          = toset(var.ui_ingress)
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 8500
  port_range_max    = 8500
  remote_ip_prefix  = each.value
  security_group_id = openstack_networking_secgroup_v2.consul_ui_security_group.id
}
