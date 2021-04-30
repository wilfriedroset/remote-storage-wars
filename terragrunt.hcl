remote_state {
  backend = "swift"
  config = {
    container         = "remote-storage-wars"
    archive_container = "remote-storage-wars-archive"
  }
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }
}

generate "override" {
  path = "override.tf"
  if_exists = "overwrite"
  disable_signature = true
  contents = fileexists("override.tf") ? file("override.tf") : "Did not find override.tf at root directory"
}

generate "providers" {
  path = "providers.tf"
  if_exists = "overwrite"
  disable_signature = true
  contents = fileexists("providers.tf") ? file("providers.tf") : "Did not find providers.tf at root directory"
}

generate "versions" {
  path = "versions.tf"
  if_exists = "overwrite"
  disable_signature = true
  contents = fileexists("versions.tf") ? file("versions.tf") : "Did not find versions.tf at root directory"
}

generate "variables" {
  path = "variables.tf"
  if_exists = "overwrite"
  disable_signature = true
  contents = fileexists("variables.tf") ? file("variables.tf") : "Did not find variables.tf at root directory"
}
