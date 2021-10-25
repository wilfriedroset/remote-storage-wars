resource "openstack_networking_secgroup_v2" "cortex_ui_security_group" {
  name        = "cortex_ui_security_group"
  description = "cortex UI security group"
  tags        = []
}

resource "openstack_networking_secgroup_rule_v2" "cortex" {
  for_each          = toset(var.ui_ingress)
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 9009
  port_range_max    = 9009
  remote_ip_prefix  = each.value
  security_group_id = openstack_networking_secgroup_v2.cortex_ui_security_group.id
}
