provider "openstack" {
  version = "~> 1.31"
  cloud   = var.cloud
}

provider "ovh" {
  version  = "~> 0.9.1"
  endpoint = var.ovh_endpoint
}
