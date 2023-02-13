variable "project" {
  default = "proyecto-cristina-garcia"
  description = "Nombre que se le ha dado al proyecto"

}
variable "region" {
  default = "europe-west2"
  description = "Region en la que se ha creado el proyecto"

}
variable "zone" {
  default = "europe-west2-c"
  description = "Zona en la que se ha creado el proyecto"

}
variable "google_compute_network_red_name" {
    default = "mi-red-practica"
    description = "El nombre que le he dado a la red"

}
variable "google_compute_subnetwork_name" {
    default = "subnetwork"
    description = "El nombre que le he dado a la subred"

}

variable "google_compute_subnetwork_range" {
    default = "10.2.0.0/16"
    description = "La ip que le he dado a la subred"
}


variable "random_string_number" {
    default = 5
    description = "El largo que quiero ponerle al nombre"

}
variable "google_storage_bucket_name" {
    default = "bucket_practica"
    description = "El nombre que le he dado al bucket"

}
variable "google_compute_address_name" {
    default = "mi-ip-end"
    description = "El nombre que le he dado a la direccion"
    
}
variable "google_compute_address_type" {
    default = "EXTERNAL"
    description = "El tipo de maquina que va a utilizar el proyecto"
   
}
variable "google_compute_instance_name" {
    default = "mi-maquina-practica"
    description = "El nombre que le he dado a la instancia"
    
}
variable "google_compute_instance_machine_type" {
    default = "f1-micro"
    description = "El tipo de maquina que le he dado a la instancia"
    
}