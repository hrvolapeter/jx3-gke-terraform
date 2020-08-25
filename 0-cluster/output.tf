output "connect" {
  description = "Connect to cluster"
  value       = "${module.jx.connect}"
}

output "next_install" {
  description = "Follow instructions to enable Jenkins X install via GitOps"
  value       = "http://jenkins-x.io/foo"
}

output "project" {
  value = var.project
}

output "location" {
  value = var.location
}

output "cluster_name" {
  value = var.cluster_name
}

output "cluster_endpoint" {
  value = module.jx.cluster_endpoint
}

output "cluster_ca_certificate" {
  value = module.jx.cluster_ca_certificate
}

output "log_storage_url" {
  value = module.jx.log_storage_url
}

output "report_storage_url" {
  value = module.jx.report_storage_url
}

output "repository_storage_url" {
  value = module.jx.repository_storage_url
}

output "vault_bucket_name" {
  value = module.jx.vault_bucket_name
}

output "vault_key" {
  value = module.jx.vault_key
}

output "vault_keyring" {
  value = module.jx.vault_keyring
}

output "vault_name" {
  value = module.jx.vault_name
}

output "vault_sa" {
  value = module.jx.vault_sa
}

output "backup_velero_sa_email" {
  value = module.jx.backup_velero_sa_email
}

output "backup_velero_sa" {
  value = module.jx.backup_velero_sa
}

output "backup_bucket_url" {
  value = module.jx.backup_bucket_url
}

output "vault_sa_email" {
  value = module.jx.vault_sa_email
}

output "dns_sa_email" {
  value = module.jx.dns_sa_email
}
output "jxui_sa_email" {
  value = module.jx.jxui_sa_email
}
output "tekton_sa_email" {
  value = module.jx.tekton_sa_email
}
output "kaniko_sa_email" {
  value = module.jx.kaniko_sa_email
}
output "build_controller_sa_email" {
  value = module.jx.build_controller_sa_email
}
output "access_token" {
  value = module.jx.access_token
}