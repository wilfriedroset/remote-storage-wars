module "vmselect" {
  source = "../terraform-ovh-linux_host"

  count           = var.vmselect_node_count
  instance_name   = format(var.vmselect_node_instance_name_template, count.index + 1)
  instance_image  = var.instance_image
  instance_flavor = var.vmselect_instance_flavor
  ssh             = var.ssh
  userdata_path   = var.userdata_path
  security_groups = var.vmselect_node_security_groups

  instance_metadata = {
    role    = "victoriametrics"
    subrole = "vmselect"
  }

  private_network = var.private_network
  domain_name     = var.domain_name
}
