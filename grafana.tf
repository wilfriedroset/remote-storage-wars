module "grafana" {
  source = "./modules/terraform-ovh-linux_host"

  instance_name   = "grafana"
  instance_image  = var.instance_image
  instance_flavor = var.grafana_instance_flavor
  ssh             = var.ssh
  userdata_path   = "userdata.yml"
  security_groups = ["ssh_security_group", "grafana_ui_security_group"]

  instance_metadata = {
    role    = "client"
    subrole = "grafana"
  }

  private_network = openstack_networking_network_v2.private_network.name
  domain_name     = var.domain_name
}

output "grafana" {
  value = var.domain_name != "" ? module.grafana[*].domain_zone_record : module.grafana[*].linuxhost
}

output "grafana_url" {
  value = [
    for instance in module.grafana[*] :
    var.domain_name != "" ? "http://${instance.domain_zone_record}:3000" : "http://${instance.linuxhost}:3000"
  ]
}
