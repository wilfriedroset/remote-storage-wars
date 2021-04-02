module "loki" {
  source = "./modules/terraform-ovh-linux_host"

  count           = 1
  instance_name   = "loki"
  instance_image  = var.instance_image
  instance_flavor = "b2-7"
  ssh             = var.ssh
  userdata        = "userdata.yml"
  security_groups = ["timescale_ssh_security_group", "timescale_consul_security_group", "timescale_ui_security_group"]

  instance_metadata = {
    role = "loki"
  }

  private_network = openstack_networking_network_v2.private_network.name
  domain_name     = var.domain_name
}
