output "id_maquina" {
    value = google_compute_instance.maquina_virtual.id
}

output "id_red" {
    value = google_compute_network.red.id
}

output "id_subred" {
    value = google_compute_subnetwork.subred.id
}

output "id_bucket" {
    value = google_storage_bucket.bucket.id
}