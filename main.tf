resource "openstack_compute_keypair_v2" "control_plane_ssh_key" {
  name       = var.ssh_key_name
  public_key = var.ssh_key
}
