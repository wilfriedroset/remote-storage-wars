# For the sake of automated tests with github action we need to define all
# variables. This is only fake data expected to be provided by end user while
# using this repository.

cloud       = "openstack"
region_name = "region"

domain_name = "fake.remote-storage-wars.io"

private_network = {
  name     = "Remote-Storage-War"
  ip_range = "3.2.1.0/24"
}

ssh_ingress = [
  "0.0.0.0/0",
]

ui_ingress = [
  "0.0.0.0/0",
]

ssh = {
  username        = "debian"
  public_key_name = "github-actions"
  public_key      = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMbka6nU1aoe4jJ+APoOE6s53tcfOBFValGZ05lmkc3K gh@fake.remote-storage-wars.io"
}
