terraform {
  required_providers {
    openstack = {
      source = "terraform-providers/openstack"
    }
    ovh = {
      source = "ovh/ovh"
    }
  }
  required_version = ">= 0.13"
}
