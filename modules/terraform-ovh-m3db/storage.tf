module "m3db_dbnode" {
  source = "../terraform-ovh-linux_host"

  count           = var.dbnode_count
  instance_name   = format(var.dbnode_instance_name_template, count.index + 1)
  instance_image  = var.instance_image
  instance_flavor = var.dbnode_instance_flavor
  ssh             = var.ssh
  userdata_path   = var.userdata_path
  security_groups = var.dbnode_security_groups

  instance_metadata = {
    role    = "m3db"
    subrole = "m3dbnode"
  }

  private_network = var.private_network
  domain_name     = var.domain_name
}
