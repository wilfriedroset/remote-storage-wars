module "victoriametrics" {
  source = "../modules/terraform-ovh-victoriametrics_cluster"

  userdata_path = "../userdata.yml"
  ssh           = var.ssh

  instance_image = var.instance_image

  domain_name     = var.domain_name
  public_network  = var.public_network
  private_network = var.private_network.name

  vminsert_instance_flavor      = var.vminsert_instance_flavor
  vminsert_lb_count             = 1
  vminsert_lb_security_groups   = ["ssh_security_group"]
  vminsert_node_count           = var.node_vminsert
  vminsert_node_security_groups = ["ssh_security_group"]

  vmselect_instance_flavor      = var.vmselect_instance_flavor
  vmselect_lb_count             = 1
  vmselect_lb_security_groups   = ["ssh_security_group"]
  vmselect_node_count           = var.node_vmselect
  vmselect_node_security_groups = ["ssh_security_group"]

  vmstorage_instance_flavor      = var.vmstorage_instance_flavor
  vmstorage_node_count           = var.node_vmstorage
  vmstorage_node_security_groups = ["ssh_security_group"]
}
