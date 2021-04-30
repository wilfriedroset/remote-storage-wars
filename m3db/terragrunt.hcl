include {
  path = find_in_parent_folders()
}

dependencies {
  paths = ["../sshkey", "../secgroups", "../network", "../prometheus", "../consul", "../etcd"]
}