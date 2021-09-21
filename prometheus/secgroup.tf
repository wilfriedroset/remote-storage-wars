resource "openstack_networking_secgroup_v2" "prometheus_ui_security_group" {
  name        = "prometheus_ui_security_group"
  description = "prometheus UI security group"
  tags        = []
}

resource "openstack_networking_secgroup_rule_v2" "prometheus" {
  for_each          = toset(var.ui_ingress)
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 9090
  port_range_max    = 9090
  remote_ip_prefix  = each.value
  security_group_id = openstack_networking_secgroup_v2.prometheus_ui_security_group.id
}
