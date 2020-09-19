# SSH

resource "openstack_networking_secgroup_v2" "timescale_ssh_security_group" {
  name        = "timescale_ssh_security_group"
  description = "timescale security group"
}

resource "openstack_networking_secgroup_rule_v2" "ssh" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = var.ingress
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

# UI

resource "openstack_networking_secgroup_v2" "timescale_ui_security_group" {
  name        = "timescale_ui_security_group"
  description = "timescale security group"
}

resource "openstack_networking_secgroup_rule_v2" "grafana" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 3000
  port_range_max    = 3000
  remote_ip_prefix  = var.ingress
  security_group_id = openstack_networking_secgroup_v2.timescale_ui_security_group.id
}

resource "openstack_networking_secgroup_rule_v2" "consul" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 8500
  port_range_max    = 8500
  remote_ip_prefix  = var.ingress
  security_group_id = openstack_networking_secgroup_v2.timescale_ui_security_group.id
}

resource "openstack_networking_secgroup_rule_v2" "prometheus_ui" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 9090
  port_range_max    = 9090
  remote_ip_prefix  = var.ingress
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
