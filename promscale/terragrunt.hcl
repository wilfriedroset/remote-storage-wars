include {
  path = find_in_parent_folders()
}

dependencies {
  paths = ["../sshkey", "../secgroups", "../network", "../consul", "../prometheus", "../distributed_timescaledb"]
}