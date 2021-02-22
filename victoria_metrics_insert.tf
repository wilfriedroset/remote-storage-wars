resource "openstack_compute_instance_v2" "vminsert" {
  count           = var.node_vminsert
  name            = format("vminsert-%d", count.index + 1)
  image_name      = var.instance_image
  flavor_name     = var.vminsert_instance_flavor
  key_pair        = var.ssh.public_key_name
  user_data       = file("userdata.yml")
  security_groups = ["timescale_ssh_security_group", "timescale_consul_security_group", "timescale_victoriametrics_security_group"]

  metadata = {
    role    = "victoriametrics"
    subrole = "vminsert"
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

resource "ovh_domain_zone_record" "vminsert" {
  count     = length(openstack_compute_instance_v2.vminsert)
  zone      = var.domain_name
  subdomain = openstack_compute_instance_v2.vminsert[count.index].name
  fieldtype = "A"
  ttl       = "60"
  target    = openstack_compute_instance_v2.vminsert[count.index].access_ip_v4
}

output "vminsert" {
  value = openstack_compute_instance_v2.vminsert[*].network[0].fixed_ip_v4
}
