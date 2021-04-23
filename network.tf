resource "openstack_networking_network_v2" "private_network" {
  name           = var.private_network.name
  admin_state_up = true
}

resource "openstack_networking_subnet_v2" "admin" {
  name        = "admin"
  network_id  = openstack_networking_network_v2.private_network.id
  ip_version  = 4
  cidr        = var.private_network.ip_range
  enable_dhcp = true
  no_gateway  = true
  # Defining default dns otherwise openstack + cloud-init will set them
  # to private_network .2 and .3 which will not resolv what we need to
  # install servers
  dns_nameservers = ["213.186.33.99", "8.8.8.8"]
}

resource "openstack_networking_subnet_v2" "consul" {
  name            = "consul"
  network_id      = openstack_networking_network_v2.private_network.id
  ip_version      = 4
  cidr            = var.private_network.ip_range
  enable_dhcp     = true
  no_gateway      = true
  dns_nameservers = ["213.186.33.99", "8.8.8.8"]
}

resource "openstack_networking_subnet_v2" "clients" {
  name            = "client"
  network_id      = openstack_networking_network_v2.private_network.id
  ip_version      = 4
  cidr            = var.private_network.ip_range
  enable_dhcp     = true
  no_gateway      = true
  dns_nameservers = ["213.186.33.99", "8.8.8.8"]
}

resource "openstack_networking_subnet_v2" "lb" {
  name            = "lb"
  network_id      = openstack_networking_network_v2.private_network.id
  ip_version      = 4
  cidr            = var.private_network.ip_range
  enable_dhcp     = true
  no_gateway      = true
  dns_nameservers = ["213.186.33.99", "8.8.8.8"]
}

resource "openstack_networking_subnet_v2" "postgresql" {
  name            = "postgresql"
  network_id      = openstack_networking_network_v2.private_network.id
  ip_version      = 4
  cidr            = var.private_network.ip_range
  enable_dhcp     = true
  no_gateway      = true
  dns_nameservers = ["213.186.33.99", "8.8.8.8"]
}

resource "openstack_networking_subnet_v2" "victoriametrics" {
  name            = "victoriametrics"
  network_id      = openstack_networking_network_v2.private_network.id
  ip_version      = 4
  cidr            = var.private_network.ip_range
  enable_dhcp     = true
  no_gateway      = true
  dns_nameservers = ["213.186.33.99", "8.8.8.8"]
}

resource "openstack_networking_subnet_v2" "promscale" {
  name            = "promscale"
  network_id      = openstack_networking_network_v2.private_network.id
  ip_version      = 4
  cidr            = var.private_network.ip_range
  enable_dhcp     = true
  no_gateway      = true
  dns_nameservers = ["213.186.33.99", "8.8.8.8"]
}
