data "terraform_remote_state" "platform" {
  backend = "local"

  config = {
    path = "../0-cluster/terraform.tfstate"
  }
}

module "jenkins" {
  source                    = "../../../jenkins-x/terraform-google-jx/1-application"
  gcp_project               = data.terraform_remote_state.platform.outputs.project
  access_token              = data.terraform_remote_state.platform.outputs.access_token
  build_controller_sa_email = data.terraform_remote_state.platform.outputs.build_controller_sa_email
  kaniko_sa_email           = data.terraform_remote_state.platform.outputs.kaniko_sa_email
  tekton_sa_email           = data.terraform_remote_state.platform.outputs.tekton_sa_email
  jxui_sa_email             = data.terraform_remote_state.platform.outputs.jxui_sa_email
  dns_sa_email              = data.terraform_remote_state.platform.outputs.dns_sa_email
  vault_sa_email            = data.terraform_remote_state.platform.outputs.vault_sa_email

  backup_bucket_url      = data.terraform_remote_state.platform.outputs.backup_bucket_url
  backup_velero_sa       = data.terraform_remote_state.platform.outputs.backup_velero_sa
  backup_velero_sa_email = data.terraform_remote_state.platform.outputs.backup_velero_sa_email
  vault_sa               = data.terraform_remote_state.platform.outputs.vault_sa
  vault_name             = data.terraform_remote_state.platform.outputs.vault_name
  vault_keyring          = data.terraform_remote_state.platform.outputs.vault_keyring
  vault_key              = data.terraform_remote_state.platform.outputs.vault_key
  vault_bucket_name      = data.terraform_remote_state.platform.outputs.vault_bucket_name
  repository_storage_url = data.terraform_remote_state.platform.outputs.repository_storage_url
  report_storage_url     = data.terraform_remote_state.platform.outputs.report_storage_url
  log_storage_url        = data.terraform_remote_state.platform.outputs.log_storage_url


  cluster_ca_certificate = data.terraform_remote_state.platform.outputs.cluster_ca_certificate
  cluster_endpoint       = data.terraform_remote_state.platform.outputs.cluster_endpoint


}

output "connect" {
  description = "Connect to cluster"
  value       = "${module.jenkins.connect}"
}

output "next_install" {
  description = "Follow instructions to enable Jenkins X install via GitOps"
  value       = "http://jenkins-x.io/foo"
}
