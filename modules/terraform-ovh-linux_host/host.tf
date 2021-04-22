resource "openstack_compute_instance_v2" "linuxhost" {
  name            = var.instance_name
  image_name      = var.instance_image
  flavor_name     = var.instance_flavor
  key_pair        = var.ssh.public_key_name
  user_data       = file(var.userdata_path)
  security_groups = var.security_groups

  metadata = var.instance_metadata

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
