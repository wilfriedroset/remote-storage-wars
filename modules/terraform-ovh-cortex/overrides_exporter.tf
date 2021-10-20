
module "overrides_exporter" {
  source = "../terraform-ovh-linux_host"

  count           = var.overrides_exporter_count
  instance_name   = format(var.overrides_exporter_instance_name_template, count.index + 1)
  instance_image  = var.instance_image
  instance_flavor = var.overrides_exporter_instance_flavor
  ssh             = var.ssh
  userdata_path   = var.userdata_path
  security_groups = var.cortex_security_groups

  instance_metadata = {
    role    = "cortex"
    subrole = "overrides_exporter"
  }

  private_network = var.private_network
  domain_name     = var.domain_name
}
