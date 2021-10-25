
module "store_gateway" {
  source = "../terraform-ovh-linux_host"

  count           = var.store_gateway_count
  instance_name   = format(var.store_gateway_instance_name_template, count.index + 1)
  instance_image  = var.instance_image
  instance_flavor = var.store_gateway_instance_flavor
  ssh             = var.ssh
  userdata_path   = var.userdata_path
  security_groups = var.cortex_security_groups

  instance_metadata = {
    role    = "cortex"
    subrole = "store_gateway"
  }

  private_network = var.private_network
  domain_name     = var.domain_name
}
