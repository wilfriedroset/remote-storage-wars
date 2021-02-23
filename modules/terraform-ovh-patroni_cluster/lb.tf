resource "openstack_compute_instance_v2" "patroni_lb" {
  count           = var.lb_count
  name            = format(var.lb_instance_name_template, count.index + 1)
  image_name      = var.instance_image
  flavor_name     = var.lb_instance_flavor
  key_pair        = var.ssh.public_key_name
  user_data       = file(var.userdata)
  security_groups = var.lb_security_groups

  metadata = {
    role    = "patroni_lb"
    cluster = var.cluster_name
  }

  network {
    name = var.public_network
  }

  network {
    name = var.private_network
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

resource "ovh_domain_zone_record" "patroni_lb" {
  count     = length(openstack_compute_instance_v2.patroni_lb)
  zone      = var.domain_name
  subdomain = openstack_compute_instance_v2.patroni_lb[count.index].name
  fieldtype = "A"
  ttl       = "60"
  target    = openstack_compute_instance_v2.patroni_lb[count.index].access_ip_v4
}
