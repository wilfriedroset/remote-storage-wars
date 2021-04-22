module "m3db_coordinator" {
  source = "../terraform-ovh-linux_host"

  count           = var.coordinator_count
  instance_name   = format(var.coordinator_instance_name_template, count.index + 1)
  instance_image  = var.instance_image
  instance_flavor = var.coordinator_instance_flavor
  ssh             = var.ssh
  userdata_path   = var.userdata_path
  security_groups = var.coordinator_security_groups

  instance_metadata = {
    role    = "m3db"
    subrole = "m3coordinator"
  }

  private_network = var.private_network
  domain_name     = var.domain_name
}
