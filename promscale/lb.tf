module "promscale_lb" {
  source = "../modules/terraform-ovh-linux_host"

  count           = var.promscale_lb_count
  instance_name   = format("promscale-lb-%d", count.index + 1)
  instance_image  = var.instance_image
  instance_flavor = var.promscale_instance_flavor
  ssh             = var.ssh
  userdata_path   = "../userdata.yml"
  security_groups = ["ssh_security_group"]

  instance_metadata = {
    role    = "lb"
    subrole = "promscale_lb"
  }

  private_network = var.private_network.name
  domain_name     = var.domain_name
}

output "promscale_lb" {
  value = var.domain_name != "" ? module.promscale_lb[*].domain_zone_record : module.promscale_lb[*].linuxhost
}
