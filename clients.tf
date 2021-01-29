resource "openstack_compute_instance_v2" "tsbs" {
  name            = "tsbs"
  image_name      = var.instance_image
  flavor_name     = var.instance_flavor
  key_pair        = var.ssh.public_key_name
  user_data       = file("userdata.yml")
  security_groups = ["timescale_ssh_security_group", "timescale_consul_security_group"]

  metadata = {
    role    = "client"
    subrole = "tsbs"
  }

  network {
    name = var.public_network
  }

  network {
    name        = openstack_networking_network_v2.private_network.name
    fixed_ip_v4 = cidrhost(openstack_networking_subnet_v2.clients.cidr, 10)
  }

  connection {
    # No need to define a password of private key. It will default to
    # default local ssh-key
    type = "ssh"
    user = var.ssh.username
    host = self.access_ip_v4
  }
  provisioner "remote-exec" {
    inline = [
      # Sending stdout to /dev/null otherwise it will flood output
      "cloud-init status --wait > /dev/null"
    ]
  }
}

resource "ovh_domain_zone_record" "tsbs" {
  zone      = var.domain_name
  subdomain = openstack_compute_instance_v2.tsbs.name
  fieldtype = "A"
  ttl       = "60"
  target    = openstack_compute_instance_v2.tsbs.access_ip_v4
}

output "tsbs" {
  value = openstack_compute_instance_v2.tsbs.network[0].fixed_ip_v4
}

resource "openstack_compute_instance_v2" "grafana" {
  name            = "grafana"
  image_name      = var.instance_image
  flavor_name     = var.instance_flavor
  key_pair        = var.ssh.public_key_name
  user_data       = file("userdata.yml")
  security_groups = ["timescale_ssh_security_group", "timescale_consul_security_group", "timescale_ui_security_group"]

  metadata = {
    role    = "client"
    subrole = "grafana"
  }

  network {
    name = var.public_network
  }

  network {
    name        = openstack_networking_network_v2.private_network.name
    fixed_ip_v4 = cidrhost(openstack_networking_subnet_v2.clients.cidr, 12)
  }

  connection {
    # No need to define a password of private key. It will default to
    # default local ssh-key
    type = "ssh"
    user = var.ssh.username
    host = self.access_ip_v4
  }
  provisioner "remote-exec" {
    inline = [
      # Sending stdout to /dev/null otherwise it will flood output
      "cloud-init status --wait > /dev/null"
    ]
  }
}

resource "ovh_domain_zone_record" "grafana" {
  zone      = var.domain_name
  subdomain = openstack_compute_instance_v2.grafana.name
  fieldtype = "A"
  ttl       = "60"
  target    = openstack_compute_instance_v2.grafana.access_ip_v4
}

output "grafana" {
  value = openstack_compute_instance_v2.grafana.network[0].fixed_ip_v4
}

resource "openstack_compute_instance_v2" "prometheus" {
  name            = "prometheus"
  image_name      = var.instance_image
  flavor_name     = var.instance_flavor
  key_pair        = var.ssh.public_key_name
  user_data       = file("userdata.yml")
  security_groups = ["timescale_ssh_security_group", "timescale_consul_security_group", "timescale_ui_security_group"]

  metadata = {
    role    = "client"
    subrole = "prometheus"
  }

  network {
    name = var.public_network
  }

  network {
    name        = openstack_networking_network_v2.private_network.name
    fixed_ip_v4 = cidrhost(openstack_networking_subnet_v2.clients.cidr, 13)
  }

  connection {
    # No need to define a password of private key. It will default to
    # default local ssh-key
    type = "ssh"
    user = var.ssh.username
    host = self.access_ip_v4
  }
  provisioner "remote-exec" {
    inline = [
      # Sending stdout to /dev/null otherwise it will flood output
      "cloud-init status --wait > /dev/null"
    ]
  }
}

resource "ovh_domain_zone_record" "prometheus" {
  zone      = var.domain_name
  subdomain = openstack_compute_instance_v2.prometheus.name
  fieldtype = "A"
  ttl       = "60"
  target    = openstack_compute_instance_v2.prometheus.access_ip_v4
}

output "prometheus" {
  value = openstack_compute_instance_v2.prometheus.network[0].fixed_ip_v4
}
