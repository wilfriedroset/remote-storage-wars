module "etcd" {
  source = "./modules/terraform-ovh-etcd/"

  node_count      = 3
  userdata_path   = "userdata.yml"
  instance_image  = var.instance_image
  ssh             = var.ssh
  private_network = openstack_networking_network_v2.private_network.name
  domain_name     = var.domain_name
  security_groups = ["ssh_security_group"]

  instance_flavor = var.etcd_instance_flavor
}

output "etcd" {
  value = var.domain_name != "" ? module.etcd[*].domain_zone_record : module.etcd[*].linuxhost
}
