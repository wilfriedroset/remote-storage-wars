module "etcd" {
  source = "./modules/terraform-ovh-etcd/"

  node_count      = 3
  userdata        = "userdata.yml"
  ssh             = var.ssh
  private_network = openstack_networking_network_v2.private_network.name
  domain_name     = var.domain_name
  security_groups = ["timescale_ssh_security_group", "timescale_consul_security_group"]

  instance_flavor = var.etcd_instance_flavor
}
