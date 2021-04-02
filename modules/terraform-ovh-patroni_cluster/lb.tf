module "patroni_lb" {
  source = "../terraform-ovh-linux_host"

  count           = var.lb_count
  instance_name   = format(var.lb_instance_name_template, count.index + 1)
  instance_image  = var.instance_image
  instance_flavor = var.lb_instance_flavor
  ssh             = var.ssh
  userdata        = var.userdata
  security_groups = var.lb_security_groups

  instance_metadata = {
    role    = "patroni_lb"
    cluster = var.cluster_name
  }

  private_network = var.private_network
  domain_name     = var.domain_name
}
