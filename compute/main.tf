resource "google_compute_instance" "vm-1" {
  name = "vm-1"
  allow_stopping_for_update = true
  boot_disk {
    initialize_params {
      image = "debian-9-stretch-v20210916"
      size = 10
    }
  }
  machine_type = "e2-micro"
  zone = "asia-southeast1-a"
  network_interface {
    # network = "custom-vpc"
    # subnetwork = "custom-sub-1"
  }
  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = "terraform@imposing-voyage-392509.iam.gserviceaccount.com"
    scopes = ["cloud-platform"]
  }
  lifecycle {
    ignore_changes = [attached_disk]
  }
}

resource "google_compute_disk" "extradisk" {
  name = "addidisk"
  zone = "asia-southeast1-a"
  size = "10"
  type = "pd-ssd"
  
}

resource "google_compute_attached_disk" "attachdisk" {
  
  instance = google_compute_instance.vm-1.id
  disk = google_compute_disk.extradisk.id
  
}

  
