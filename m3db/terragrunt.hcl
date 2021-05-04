include {
  path = find_in_parent_folders()
}

dependencies {
  paths = ["../ssh", "../secgroups", "../network", "../prometheus", "../consul", "../etcd"]
}