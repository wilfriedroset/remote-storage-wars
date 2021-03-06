module "promscale" {
  source = "../modules/terraform-ovh-linux_host"

  count           = var.promscale_node_count
  instance_name   = format("promscale-node-%d", count.index + 1)
  instance_image  = var.instance_image
  instance_flavor = var.promscale_instance_flavor
  ssh             = var.ssh
  userdata_path   = "../userdata.yml"
  security_groups = ["ssh_security_group", "pprof_ui_security_group"]

  instance_metadata = {
    role = "promscale"
  }

  private_network = var.private_network.name
  domain_name     = var.domain_name
}

output "promscale" {
  value = var.domain_name != "" ? module.promscale[*].domain_zone_record : module.promscale[*].linuxhost
}
