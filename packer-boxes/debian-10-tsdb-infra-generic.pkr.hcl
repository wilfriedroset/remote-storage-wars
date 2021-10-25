variable "flavor_id" {
  type = string
}

variable "network_id" {
  type = string
}

source "openstack" "debian_10_tsdb_infra_generic" {
  # Let's build a generic image to leave room for a more specific image
  image_name        = "Debian 10 - TSDB Infra - generic"
  source_image_name = "Debian 10"

  flavor   = "${var.flavor_id}"   # s1-2
  networks = ["${var.network_id}"] # ext-net

  ssh_ip_version = "4"
  ssh_username   = "debian"
}

build {
  sources = ["source.openstack.debian_10_tsdb_infra_generic"]

  provisioner "shell" {
    script = "scripts/install-ansible.sh"
  }
  provisioner "ansible-local" {
    playbook_dir  = "../playbook/"
    galaxy_file   = "../playbook/requirements.yml"
    playbook_file = "../playbook/common.yml"
  }

}
