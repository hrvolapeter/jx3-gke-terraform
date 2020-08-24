module "jx" {
  source           = "../../jenkins-x/terraform-google-jx"
  gcp_project      = var.project
  cluster_location = var.location
  cluster_name     = var.cluster_name
  cluster_private = {
    enabled                = true
    master_ipv4_cidr_block = "10.5.0.0/28"
  }

  cluster_ip_allocation_policy = {
    enabled                  = true
    vpc_cidr_block           = module.network.ip_cidr_range
    vpc_secondary_cidr_block = module.network.secondary_ip_range.ip_cidr_range
    master_authorized_cidr = module.network.bastion_ip
  }
  node_preemptible = true
  jx2              = false

}

output "connect" {
  description = "Connect to cluster"
  value       = "${module.jx.connect}"
}

output "next_install" {
  description = "Follow instructions to enable Jenkins X install via GitOps"
  value       = "http://jenkins-x.io/foo"
}


module "network" {
  source       = "./modules/network"
  project      = var.project
  location     = var.location
  region       = var.region
  cluster_name = var.cluster_name
}