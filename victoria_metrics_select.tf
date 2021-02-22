resource "openstack_compute_instance_v2" "vmselect" {
  count           = var.node_vmselect
  name            = format("vmselect-%d", count.index + 1)
  image_name      = var.instance_image
  flavor_name     = var.vmselect_instance_flavor
  key_pair        = var.ssh.public_key_name
  user_data       = file("userdata.yml")
  security_groups = ["timescale_ssh_security_group", "timescale_consul_security_group", "timescale_victoriametrics_security_group"]

  metadata = {
    role    = "victoriametrics"
    subrole = "vmselect"
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

resource "ovh_domain_zone_record" "vmselect" {
  count     = length(openstack_compute_instance_v2.vmselect)
  zone      = var.domain_name
  subdomain = openstack_compute_instance_v2.vmselect[count.index].name
  fieldtype = "A"
  ttl       = "60"
  target    = openstack_compute_instance_v2.vmselect[count.index].access_ip_v4
}

output "vmselect" {
  value = openstack_compute_instance_v2.vmselect[*].network[0].fixed_ip_v4
}
