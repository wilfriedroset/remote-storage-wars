module "tsbs" {
  source = "./modules/terraform-ovh-linux_host"

  count           = var.tsbs_count
  instance_name   = format("tsbs-%d", count.index + 1)
  instance_image  = var.instance_image
  instance_flavor = var.tsbs_instance_flavor
  ssh             = var.ssh
  userdata_path   = "userdata.yml"
  security_groups = ["ssh_security_group"]

  instance_metadata = {
    role    = "client"
    subrole = "tsbs"
  }

  private_network = openstack_networking_network_v2.private_network.name
  domain_name     = var.domain_name
}
