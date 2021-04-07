source "openstack" "debian_10_tsdb_infra_generic" {
  # Let's build a generic image to leave room for a more specific image
  image_name        = "Debian 10 - TSDB Infra - generic"
  source_image_name = "Debian 10"

  flavor   = "30223b8d-0b3e-4a42-accb-ebc3f5b0194c"   # s1-2
  networks = ["393d06cc-a82c-4dc4-a576-c79e8dd67ba3"] # ext-net

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
