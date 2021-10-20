
module "configs" {
  source = "../terraform-ovh-linux_host"

  count           = var.configs_count
  instance_name   = format(var.configs_instance_name_template, count.index + 1)
  instance_image  = var.instance_image
  instance_flavor = var.configs_instance_flavor
  ssh             = var.ssh
  userdata_path   = var.userdata_path
  security_groups = var.cortex_security_groups

  instance_metadata = {
    role    = "cortex"
    subrole = "configs"
  }

  private_network = var.private_network
  domain_name     = var.domain_name
}
