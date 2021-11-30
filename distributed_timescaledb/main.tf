module "distributed-timescaledb" {
  source = "../modules/terraform-ovh-distributed_timescaledb/"

  node_count              = var.node_per_patroni_cluster
  lb_count                = var.lb_per_patroni_cluster
  instance_image          = var.instance_image
  userdata_path           = "../userdata.yml"
  ssh                     = var.ssh
  private_network         = var.private_network.name
  domain_name             = var.domain_name
  patroni_security_groups = ["ssh_security_group"]
  lb_security_groups      = ["ssh_security_group"]

  patroni_instance_flavor = var.postgresql_instance_flavor
  lb_instance_flavor      = var.lb_instance_flavor
}
