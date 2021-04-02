module "patroni_servers" {
  source = "../terraform-ovh-linux_host"

  count           = var.node_count
  instance_name   = format(var.patroni_instance_name_template, count.index + 1)
  instance_image  = var.instance_image
  instance_flavor = var.patroni_instance_flavor
  ssh             = var.ssh
  userdata        = var.userdata
  security_groups = var.patroni_security_groups

  instance_metadata = {
    role    = "patroni_server"
    cluster = var.cluster_name
  }

  private_network = var.private_network
  domain_name     = var.domain_name
}
