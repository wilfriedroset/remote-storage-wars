provider "openstack" {
  cloud  = var.cloud
  region = var.region_name
}

provider "ovh" {
  endpoint = var.ovh_endpoint
}
