resource "openstack_networking_secgroup_v2" "tempo_security_group" {
  name        = "tempo_security_group"
  description = "tempo security group"
  tags        = []
}

resource "openstack_networking_secgroup_rule_v2" "tempo" {
  for_each          = toset(var.ui_ingress)
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 3200
  port_range_max    = 3200
  remote_ip_prefix  = each.value
  security_group_id = openstack_networking_secgroup_v2.tempo_security_group.id
}
