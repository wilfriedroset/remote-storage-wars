terraform {
  backend "swift" {
    archive_container = "remote-storage-wars-archive"
    container         = "remote-storage-wars"
  }
}
