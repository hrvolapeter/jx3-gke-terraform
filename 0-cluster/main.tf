module "jx" {
  source             = "../../../jenkins-x/terraform-google-jx/0-platform"
  gcp_project        = var.project
  cluster_location   = var.location
  cluster_name       = var.cluster_name
  cluster_network    = module.network.network_self_link
  cluster_subnetwork = module.network.subnetwork_self_link
  cluster_private = {
    enabled                = true
    master_ipv4_cidr_block = "10.5.0.0/28"
    master_authorized_cidr = "${module.network.bastion_ip}/32"
  }

  cluster_ip_allocation_policy = {
    enabled                       = true
    cluster_secondary_range_name  = module.network.secondary_ip_range.0.range_name
    services_secondary_range_name = module.network.secondary_ip_range.1.range_name
  }
  node_preemptible = true
  jx2              = false

}

module "network" {
  source       = "./modules/network"
  project      = var.project
  location     = var.location
  region       = var.region
  cluster_name = var.cluster_name
}