module "consul_server" {
  source = "./modules/terraform-ovh-linux_host"

  count           = 3
  instance_name   = format("consul-%d", count.index + 1)
  instance_image  = var.instance_image
  instance_flavor = var.consul_instance_flavor
  ssh             = var.ssh
  userdata_path   = "userdata.yml"
  security_groups = ["timescale_ssh_security_group", "timescale_consul_security_group", "timescale_ui_security_group"]

  instance_metadata = {
    role = "consul_server"
  }

  private_network = openstack_networking_network_v2.private_network.name
  domain_name     = var.domain_name
}
