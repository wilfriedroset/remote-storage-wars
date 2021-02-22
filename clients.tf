resource "openstack_compute_instance_v2" "tsbs" {
  count           = var.tsbs_count
  name            = format("tsbs-%d", count.index + 1)
  image_name      = var.instance_image
  flavor_name     = var.tsbs_instance_flavor
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
    name = openstack_networking_network_v2.private_network.name
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
  count     = length(openstack_compute_instance_v2.tsbs)
  subdomain = openstack_compute_instance_v2.tsbs[count.index].name
  fieldtype = "A"
  ttl       = "60"
  target    = openstack_compute_instance_v2.tsbs[count.index].access_ip_v4
}

output "tsbs" {
  value = openstack_compute_instance_v2.tsbs[*].network[0].fixed_ip_v4
}

resource "openstack_compute_instance_v2" "grafana" {
  name            = "grafana"
  image_name      = var.instance_image
  flavor_name     = var.grafana_instance_flavor
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
    name = openstack_networking_network_v2.private_network.name
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
  count           = var.prometheus_count
  name            = format("prometheus-%d", count.index + 1)
  image_name      = var.instance_image
  flavor_name     = var.prometheus_instance_flavor
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
    name = openstack_networking_network_v2.private_network.name
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
  count     = length(openstack_compute_instance_v2.prometheus)
  subdomain = openstack_compute_instance_v2.prometheus[count.index].name
  fieldtype = "A"
  ttl       = "60"
  target    = openstack_compute_instance_v2.prometheus[count.index].access_ip_v4
}

output "prometheus" {
  value = openstack_compute_instance_v2.prometheus[*].network[0].fixed_ip_v4
}
