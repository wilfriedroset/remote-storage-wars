# I've purposedly duplicate lb_insert & lb_select, as I hope that one day I will
# be able to simply switch from doing my own lb and instantiate one managed for
# me.

module "lb_select" {
  source = "../terraform-ovh-linux_host"

  count           = var.vmselect_lb_count
  instance_name   = format(var.vmselect_lb_instance_name_template, count.index + 1)
  instance_image  = var.instance_image
  instance_flavor = var.lb_instance_flavor
  ssh             = var.ssh
  userdata        = var.userdata
  security_groups = var.vmselect_lb_security_groups

  instance_metadata = {
    role    = "lb"
    subrole = "vmselect_lb"
  }

  private_network = var.private_network
  domain_name     = var.domain_name
}
