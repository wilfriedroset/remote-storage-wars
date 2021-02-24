module "patroni-cluster-0" {
  source = "./modules/terraform-ovh-patroni_cluster/"

  userdata                       = "userdata.yml"
  patroni_instance_name_template = "postgresql-0-node-%d"
  lb_instance_name_template      = "postgresql-0-lb-%d"
  ssh                            = var.ssh
  cluster_name                   = "0"
  private_network                = openstack_networking_network_v2.private_network.name
  domain_name                    = var.domain_name
  patroni_security_groups        = ["timescale_ssh_security_group", "timescale_consul_security_group", "timescale_postgresql_security_group"]
  lb_security_groups             = ["timescale_ssh_security_group", "timescale_consul_security_group", "timescale_lb_security_group"]
}
