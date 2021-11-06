module "prometheus" {
  source = "../modules/terraform-ovh-linux_host"

  count           = var.prometheus_count
  instance_name   = format("prometheus-%d", count.index)
  instance_image  = var.instance_image
  instance_flavor = var.prometheus_instance_flavor
  ssh             = var.ssh
  userdata_path   = "../userdata.yml"
  security_groups = ["ssh_security_group", "prometheus_ui_security_group"]

  instance_metadata = {
    role    = "client"
    subrole = "prometheus"
    cluster = var.cluster_name
  }

  private_network = var.private_network.name
  domain_name     = var.domain_name
}

output "prometheus" {
  value = var.domain_name != "" ? module.prometheus[*].domain_zone_record : module.prometheus[*].linuxhost
}

output "prometheus_url" {
  value = [
    for instance in module.prometheus[*] :
    var.domain_name != "" ? "http://${instance.domain_zone_record}:9090" : "http://${instance.linuxhost}:9090"
  ]
}
