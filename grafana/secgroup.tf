resource "openstack_networking_secgroup_v2" "grafana_ui_security_group" {
  name        = "grafana_ui_security_group"
  description = "grafana UI security group"
  tags        = []
}

resource "openstack_networking_secgroup_rule_v2" "grafana" {
  for_each          = toset(var.ui_ingress)
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 3000
  port_range_max    = 3000
  remote_ip_prefix  = each.value
  security_group_id = openstack_networking_secgroup_v2.grafana_ui_security_group.id
}
