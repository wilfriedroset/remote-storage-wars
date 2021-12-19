module "tempo" {
  source = "../modules/terraform-ovh-linux_host"

  count           = 1
  instance_name   = "tempo"
  instance_image  = var.instance_image
  instance_flavor = var.tempo_instance_flavor
  ssh             = var.ssh
  userdata_path   = "../userdata.yml"
  security_groups = ["ssh_security_group", "tempo_security_group"]

  instance_metadata = {
    role = "tempo"
  }

  private_network = var.private_network.name
  domain_name     = var.domain_name
}

output "tempo" {
  value = var.domain_name != "" ? module.tempo[*].domain_zone_record : module.tempo[*].linuxhost
}
