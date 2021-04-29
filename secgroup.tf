# SSH

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

# UI

resource "openstack_networking_secgroup_v2" "grafana_ui_security_group" {
  name        = "grafana_ui_security_group"
  description = "grafana UI security group"
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

resource "openstack_networking_secgroup_v2" "prometheus_ui_security_group" {
  name        = "prometheus_ui_security_group"
  description = "prometheus UI security group"
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
  port_range_max    = 8080
  remote_ip_prefix  = each.value
  security_group_id = openstack_networking_secgroup_v2.pprof_ui_security_group.id
}
