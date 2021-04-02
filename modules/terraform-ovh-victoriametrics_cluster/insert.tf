module "vminsert" {
  source = "../terraform-ovh-linux_host"

  count           = var.vminsert_node_count
  instance_name   = format(var.vminsert_node_instance_name_template, count.index + 1)
  instance_image  = var.instance_image
  instance_flavor = var.vminsert_instance_flavor
  ssh             = var.ssh
  userdata        = var.userdata
  security_groups = var.vminsert_node_security_groups

  instance_metadata = {
    role    = "victoriametrics"
    subrole = "vminsert"
  }

  private_network = var.private_network
  domain_name     = var.domain_name
}
