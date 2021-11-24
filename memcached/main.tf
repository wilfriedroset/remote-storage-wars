module "memcached" {
  source = "../modules/terraform-ovh-linux_host"

  count           = var.memcached_count
  instance_name   = format("memcached-%d", count.index + 1)
  instance_image  = var.instance_image
  instance_flavor = var.memcached_instance_flavor
  ssh             = var.ssh
  userdata_path   = "../userdata.yml"
  security_groups = ["ssh_security_group"]

  instance_metadata = {
    role = "memcached"
  }

  private_network = var.private_network.name
  domain_name     = var.domain_name
}

output "memcached" {
  value = var.domain_name != "" ? module.memcached[*].domain_zone_record : module.memcached[*].linuxhost
}
