resource "openstack_networking_network_v2" "private_network" {
  name           = "poc_wr_private_network"
  admin_state_up = true
}

resource "openstack_networking_subnet_v2" "admin" {
  name        = "admin"
  network_id  = openstack_networking_network_v2.private_network.id
  ip_version  = 4
  cidr        = cidrsubnet(var.private_network, 8, 1)
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
  cidr            = cidrsubnet(var.private_network, 8, 2)
  enable_dhcp     = true
  no_gateway      = true
  dns_nameservers = ["213.186.33.99", "8.8.8.8"]
}

resource "openstack_networking_subnet_v2" "postgresql" {
  name            = "postgresql"
  network_id      = openstack_networking_network_v2.private_network.id
  ip_version      = 4
  cidr            = cidrsubnet(var.private_network, 8, 5)
  enable_dhcp     = true
  no_gateway      = true
  dns_nameservers = ["213.186.33.99", "8.8.8.8"]
}
