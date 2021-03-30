# I've purposedly duplicate lb_insert & lb_select, as I hope that one day I will
# be able to simply switch from doing my own lb and instantiate one managed for
# me.

resource "openstack_compute_instance_v2" "lb_select" {
  count           = var.vmselect_lb_count
  name            = format(var.vmselect_lb_instance_name_template, count.index + 1)
  image_name      = var.instance_image
  flavor_name     = var.lb_instance_flavor
  key_pair        = var.ssh.public_key_name
  user_data       = var.userdata
  security_groups = var.vmselect_lb_security_groups

  metadata = {
    role    = "lb"
    subrole = "vmselect_lb"
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

resource "ovh_domain_zone_record" "lb_select" {
  count     = length(openstack_compute_instance_v2.lb_select)
  zone      = var.domain_name
  subdomain = openstack_compute_instance_v2.lb_select[count.index].name
  fieldtype = "A"
  ttl       = "60"
  target    = openstack_compute_instance_v2.lb_select[count.index].access_ip_v4
}

output "lb_select" {
  value = openstack_compute_instance_v2.lb_select[*].network[0].fixed_ip_v4
}
