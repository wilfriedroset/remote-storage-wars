terraform {
  extra_arguments "conditional_vars" {
    commands = [
      "apply",
      "plan",
      "destroy",
      "import",
      "push",
      "refresh"
    ]

    optional_var_files = [
      "${get_parent_terragrunt_dir()}/override.tfvars",
      "${get_terragrunt_dir()}/override.tfvars",
    ]
  }
}

remote_state {
  backend = "swift"
  config = {
    container         = "remote-storage-wars"
    archive_container = "remote-storage-wars-archive"
    # Each child terraform plan will be stored in it's dedicated file, hence
    # specifying a state_name using path_relative_to_include(). The ternary aims
    # to avoid having a file named `.tfstate`.
    state_name        = "${path_relative_to_include()}" == "." ? "root.tfstate" : "${path_relative_to_include()}.tfstate"
  }

  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }
}

generate "common" {
  path = "common.tf"
  contents = file("common.hcl")
  if_exists = "overwrite"
}

generate "version" {
  path      = "versions.tf"
  if_exists = "skip"
  contents = <<EOF
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
EOF
}

generate "provider" {
  path      = "providers.tf"
  if_exists = "skip"
  contents = <<EOF
provider "openstack" {
  cloud  = var.cloud
  region = var.region_name
}

provider "ovh" {
  endpoint = var.ovh_endpoint
}
EOF
}
