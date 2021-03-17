module "patroni-access-node" {
  source = "../terraform-ovh-patroni_cluster/"

  userdata                       = var.userdata
  patroni_instance_name_template = var.access_node_patroni_instance_name_template
  lb_instance_name_template      = var.access_node_lb_instance_name_template
  ssh                            = var.ssh
  cluster_name                   = var.access_node_cluster_name
  private_network                = var.private_network
  domain_name                    = var.domain_name
  patroni_security_groups        = var.patroni_security_groups
  lb_security_groups             = var.lb_security_groups

  patroni_instance_flavor = var.patroni_instance_flavor
  lb_instance_flavor      = var.lb_instance_flavor
}

module "patroni-data-node-shard" {
  source = "../terraform-ovh-patroni_cluster/"

  count = var.shard_count

  userdata                       = var.userdata
  patroni_instance_name_template = format(var.data_node_patroni_instance_name_template, count.index + 1)
  lb_instance_name_template      = format(var.data_node_lb_instance_name_template, count.index + 1)
  ssh                            = var.ssh
  cluster_name                   = format(var.data_node_cluster_name_template, count.index + 1)
  private_network                = var.private_network
  domain_name                    = var.domain_name
  patroni_security_groups        = var.patroni_security_groups
  lb_security_groups             = var.lb_security_groups

  patroni_instance_flavor = var.patroni_instance_flavor
  lb_instance_flavor      = var.lb_instance_flavor
}
