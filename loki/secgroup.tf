resource "openstack_networking_secgroup_v2" "loki_security_group" {
  name        = "loki_security_group"
  description = "loki security group"
  tags        = []
}

resource "openstack_networking_secgroup_rule_v2" "loki" {
  for_each          = toset(var.ui_ingress)
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 3100
  port_range_max    = 3100
  remote_ip_prefix  = each.value
  security_group_id = openstack_networking_secgroup_v2.loki_security_group.id
}
