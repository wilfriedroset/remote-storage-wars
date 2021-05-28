module "m3db" {
  source = "../modules/terraform-ovh-m3db/"

  dbnode_count      = var.m3_dbnode_count
  coordinator_count = var.m3_coordinator_count
  query_count       = var.m3_query_count
  aggregator_count  = var.m3_aggregator_count
  lb_count          = var.m3_lb_count

  instance_image              = var.instance_image
  userdata_path               = "../userdata.yml"
  ssh                         = var.ssh
  private_network             = var.private_network.name
  domain_name                 = var.domain_name
  dbnode_security_groups      = ["ssh_security_group"]
  coordinator_security_groups = ["ssh_security_group"]
  query_security_groups       = ["ssh_security_group"]
  aggregator_security_groups  = ["ssh_security_group"]
  lb_security_groups          = ["ssh_security_group"]

  dbnode_instance_flavor      = var.m3_dbnode_instance_flavor
  coordinator_instance_flavor = var.m3_coordinator_instance_flavor
  query_instance_flavor       = var.m3_query_instance_flavor
  aggregator_instance_flavor  = var.m3_aggregator_instance_flavor
  lb_instance_flavor          = var.m3_lb_instance_flavor
}
