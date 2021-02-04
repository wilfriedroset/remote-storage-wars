resource "openstack_compute_instance_v2" "consul_server" {
  count           = 3
  name            = format("consul-%d", count.index + 1)
  image_name      = var.instance_image
  flavor_name     = var.consul_instance_flavor
  key_pair        = var.ssh.public_key_name
  user_data       = file("userdata.yml")
  security_groups = ["timescale_ssh_security_group", "timescale_consul_security_group", "timescale_ui_security_group"]

  metadata = {
    role = "consul_server"
  }

  network {
    name = var.public_network
  }

  network {
    name        = openstack_networking_network_v2.private_network.name
    fixed_ip_v4 = cidrhost(openstack_networking_subnet_v2.consul.cidr, count.index + 10)
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

resource "ovh_domain_zone_record" "consul_server" {
  count     = length(openstack_compute_instance_v2.consul_server)
  zone      = var.domain_name
  subdomain = openstack_compute_instance_v2.consul_server[count.index].name
  fieldtype = "A"
  ttl       = "60"
  target    = openstack_compute_instance_v2.consul_server[count.index].access_ip_v4
}

output "consul_server" {
  value = openstack_compute_instance_v2.consul_server[*].network[0].fixed_ip_v4
}
