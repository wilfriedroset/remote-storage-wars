
module "ruler" {
  source = "../terraform-ovh-linux_host"

  count           = var.ruler_count
  instance_name   = format(var.ruler_instance_name_template, count.index + 1)
  instance_image  = var.instance_image
  instance_flavor = var.ruler_instance_flavor
  ssh             = var.ssh
  userdata_path   = var.userdata_path
  security_groups = var.cortex_security_groups

  instance_metadata = {
    role    = "cortex"
    subrole = "ruler"
  }

  private_network = var.private_network
  domain_name     = var.domain_name
}
