provider "openstack" {
  cloud = var.cloud
}

provider "ovh" {
  endpoint = var.ovh_endpoint
}
