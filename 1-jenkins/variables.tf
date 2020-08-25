variable "project" {
}

variable "cluster_name" {
  type    = string
  default = "dev"
}

variable "location" {
  type    = string
  default = "europe-west1-c"
}

variable "region" {
  type    = string
  default = "europe-west1"
}

variable "project_services" {
  type = list

  default = [
    "cloudresourcemanager.googleapis.com",
    "servicenetworking.googleapis.com",
    "container.googleapis.com",
    "compute.googleapis.com",
    "iam.googleapis.com",
    "logging.googleapis.com",
    "monitoring.googleapis.com",
    "sqladmin.googleapis.com",
    "securetoken.googleapis.com",
  ]
  description = <<-EOF
  The GCP APIs that should be enabled in this project.
  EOF
}