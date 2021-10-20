resource "openstack_objectstorage_container_v1" "backend" {
  name   = var.objectstorage_container_name
  region = var.objectstorage_region
}
