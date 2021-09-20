resource "openstack_blockstorage_volume_v3" "volumes" {
  for_each    = var.block_storages
  name        = each.key
  size        = each.value.size
  volume_type = each.value.volume_type
}

resource "openstack_compute_volume_attach_v2" "volumes_attach" {
  for_each    = openstack_blockstorage_volume_v3.volumes
  instance_id = openstack_compute_instance_v2.linuxhost.id
  volume_id   = each.value.id
}
