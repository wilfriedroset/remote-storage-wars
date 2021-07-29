resource "openstack_networking_secgroup_v2" "pprof_ui_security_group" {
  name        = "pprof_ui_security_group"
  description = "pprof UI security group"
}

resource "openstack_networking_secgroup_rule_v2" "pprof" {
  for_each          = toset(var.ui_ingress)
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 8080
  port_range_max    = 8090
  remote_ip_prefix  = each.value
  security_group_id = openstack_networking_secgroup_v2.pprof_ui_security_group.id
}
