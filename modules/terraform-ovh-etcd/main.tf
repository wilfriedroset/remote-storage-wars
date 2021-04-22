module "etcd_server" {
  source = "../terraform-ovh-linux_host"

  count           = var.node_count
  instance_name   = format(var.instance_name_template, count.index + 1)
  instance_image  = var.instance_image
  instance_flavor = var.instance_flavor
  ssh             = var.ssh
  userdata_path   = var.userdata_path
  security_groups = var.security_groups

  instance_metadata = {
    role = "etcd_server"
  }

  private_network = var.private_network
  domain_name     = var.domain_name
}
