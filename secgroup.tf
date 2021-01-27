# SSH

resource "openstack_networking_secgroup_v2" "timescale_ssh_security_group" {
  name        = "timescale_ssh_security_group"
  description = "timescale security group"
}

resource "openstack_networking_secgroup_rule_v2" "ssh" {
  for_each          = toset(var.ssh_ingress)
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = each.value
  security_group_id = openstack_networking_secgroup_v2.timescale_ssh_security_group.id
}

# Consul

resource "openstack_networking_secgroup_v2" "timescale_consul_security_group" {
  name        = "timescale_consul_security_group"
  description = "timescale security group"
}

resource "openstack_networking_secgroup_rule_v2" "consul_dns" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 8600
  port_range_max    = 8600
  remote_ip_prefix  = var.private_network
  security_group_id = openstack_networking_secgroup_v2.timescale_consul_security_group.id
}

resource "openstack_networking_secgroup_rule_v2" "consul_http" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 8500
  port_range_max    = 8500
  remote_ip_prefix  = var.private_network
  security_group_id = openstack_networking_secgroup_v2.timescale_consul_security_group.id
}

resource "openstack_networking_secgroup_rule_v2" "consul_serf_lan" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 8301
  port_range_max    = 8301
  remote_ip_prefix  = var.private_network
  security_group_id = openstack_networking_secgroup_v2.timescale_consul_security_group.id
}

resource "openstack_networking_secgroup_rule_v2" "consul_serf_wan" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 8302
  port_range_max    = 8302
  remote_ip_prefix  = var.private_network
  security_group_id = openstack_networking_secgroup_v2.timescale_consul_security_group.id
}

resource "openstack_networking_secgroup_rule_v2" "consul_server" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 8300
  port_range_max    = 8300
  remote_ip_prefix  = var.private_network
  security_group_id = openstack_networking_secgroup_v2.timescale_consul_security_group.id
}

# PostgreSQL

resource "openstack_networking_secgroup_v2" "timescale_postgresql_security_group" {
  name        = "timescale_postgresql_security_group"
  description = "timescale security group"
}

resource "openstack_networking_secgroup_rule_v2" "postgresql" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 5432
  port_range_max    = 5432
  remote_ip_prefix  = cidrsubnet(var.private_network, 8, 5)
  security_group_id = openstack_networking_secgroup_v2.timescale_postgresql_security_group.id
}

# VictoriaMetrics

resource "openstack_networking_secgroup_v2" "timescale_victoriametrics_security_group" {
  name        = "timescale_victoriametrics_security_group"
  description = "timescale security group"
}

resource "openstack_networking_secgroup_rule_v2" "victoriametrics" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 5432
  port_range_max    = 5432
  remote_ip_prefix  = cidrsubnet(var.private_network, 8, 6)
  security_group_id = openstack_networking_secgroup_v2.timescale_victoriametrics_security_group.id
}

# UI

resource "openstack_networking_secgroup_v2" "timescale_ui_security_group" {
  name        = "timescale_ui_security_group"
  description = "timescale security group"
}

resource "openstack_networking_secgroup_rule_v2" "grafana" {
  for_each          = toset(var.ui_ingress)
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 3000
  port_range_max    = 3000
  remote_ip_prefix  = each.value
  security_group_id = openstack_networking_secgroup_v2.timescale_ui_security_group.id
}

resource "openstack_networking_secgroup_rule_v2" "consul" {
  for_each          = toset(var.ui_ingress)
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 8500
  port_range_max    = 8500
  remote_ip_prefix  = each.value
  security_group_id = openstack_networking_secgroup_v2.timescale_ui_security_group.id
}

resource "openstack_networking_secgroup_rule_v2" "prometheus_ui" {
  for_each          = toset(var.ui_ingress)
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 9090
  port_range_max    = 9090
  remote_ip_prefix  = each.value
  security_group_id = openstack_networking_secgroup_v2.timescale_ui_security_group.id
}

# Prometheus

resource "openstack_networking_secgroup_v2" "timescale_prometheus_security_group" {
  name        = "timescale_prometheus_security_group"
  description = "timescale security group"
}

resource "openstack_networking_secgroup_rule_v2" "prometheus" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 9201
  port_range_max    = 9201
  remote_ip_prefix  = var.private_network
  security_group_id = openstack_networking_secgroup_v2.timescale_prometheus_security_group.id
}

# LB

resource "openstack_networking_secgroup_v2" "timescale_lb_security_group" {
  name        = "timescale_lb_security_group"
  description = "timescale security group"
}

resource "openstack_networking_secgroup_rule_v2" "lb_pg_rw" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 3000
  port_range_max    = 3000
  remote_ip_prefix  = cidrsubnet(var.private_network, 8, 4)
  security_group_id = openstack_networking_secgroup_v2.timescale_lb_security_group.id
}

resource "openstack_networking_secgroup_rule_v2" "lb_pg_ro" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 4000
  port_range_max    = 4000
  remote_ip_prefix  = cidrsubnet(var.private_network, 8, 4)
  security_group_id = openstack_networking_secgroup_v2.timescale_lb_security_group.id
}

resource "openstack_networking_secgroup_rule_v2" "lb_victoria_insert" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 8480
  port_range_max    = 8480
  remote_ip_prefix  = cidrsubnet(var.private_network, 8, 4)
  security_group_id = openstack_networking_secgroup_v2.timescale_lb_security_group.id
}

resource "openstack_networking_secgroup_rule_v2" "lb_victoria_select" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 8481
  port_range_max    = 8481
  remote_ip_prefix  = cidrsubnet(var.private_network, 8, 4)
  security_group_id = openstack_networking_secgroup_v2.timescale_lb_security_group.id
}
