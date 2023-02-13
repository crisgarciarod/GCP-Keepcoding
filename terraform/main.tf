# LIBRERIA
terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.32.0"
    }
  }
}

# PROVIDER
provider "google" {
  credentials = file("credenciales.json")

  project = var.project 
  region = var.region 
  zone = var.zone 
}

# RED
resource "google_compute_network" "red" {
  name = var.google_compute_network_red_name  
  auto_create_subnetworks = false
}

# SUBRED
resource "google_compute_subnetwork" "subred" {
    name          = var.google_compute_subnetwork_name 
    ip_cidr_range = var.google_compute_subnetwork_range 
    region        = var.region
    network       = google_compute_network.red.id 
}

# RANDOM TEXT
resource "random_string" "texto" {
  length = var.random_string_number 
  special = false
  upper = false
}

# BUCKET
resource "google_storage_bucket" "bucket" {
  name = "${var.google_storage_bucket_name}_${random_string.texto.result}" 
  location = var.region 
}

# EXTERNAL IP
resource "google_compute_address" "ip" {
  name = var.google_compute_address_name 
  address_type =  var.google_compute_address_type  
}

# INSTANCE
resource "google_compute_instance" "maquina_virtual" {
 # depends_on = [google_compute_network.red, google_compute_network.subnet, google_compute_address.ip]
  name = var.google_compute_instance_name 
  machine_type = var.google_compute_instance_machine_type 
  tags = ["foo", "bar", "web", "dev"] 

  boot_disk {
    initialize_params {
      image = "projects/ubuntu-os-cloud/global/images/ubuntu-2004-focal-v20220810"
    }
  }
  network_interface {
    network = google_compute_network.red.name
    subnetwork = google_compute_subnetwork.subred.name
    access_config {
      nat_ip = google_compute_address.ip.address
    }
  }
}
