terraform {
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.31"
    }
    ovh = {
      source  = "ovh/ovh"
      version = "~> 0.9.1"
    }
  }
  required_version = ">= 0.14"
}