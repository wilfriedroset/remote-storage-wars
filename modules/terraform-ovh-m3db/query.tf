module "m3db_query" {
  source = "../terraform-ovh-linux_host"

  count           = var.query_count
  instance_name   = format(var.query_instance_name_template, count.index + 1)
  instance_image  = var.instance_image
  instance_flavor = var.query_instance_flavor
  ssh             = var.ssh
  userdata_path   = var.userdata_path
  security_groups = var.query_security_groups

  instance_metadata = {
    role    = "m3db"
    subrole = "m3query"
  }

  private_network = var.private_network
  domain_name     = var.domain_name
}
