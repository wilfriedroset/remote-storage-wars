
module "all_in_one" {
  source = "../terraform-ovh-linux_host"

  count           = var.all_in_one_count
  instance_name   = format(var.all_in_one_instance_name_template, count.index + 1)
  instance_image  = var.instance_image
  instance_flavor = var.all_in_one_instance_flavor
  ssh             = var.ssh
  userdata_path   = var.userdata_path
  security_groups = var.cortex_security_groups

  instance_metadata = {
    role    = "cortex"
    subrole = "all_in_one"
  }

  private_network = var.private_network
  domain_name     = var.domain_name
}
