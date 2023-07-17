terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.73.0"
    }
  }
}

provider "google" {
  # Configuration options
  project = "imposing-voyage-392509"
  zone = "us-central1-a"
  credentials = "./keys.json"
}

