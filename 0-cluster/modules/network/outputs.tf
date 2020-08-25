output "bastion_ssh" {
  description = "Gcloud compute ssh to the bastion host command"
  value       = format("gcloud compute ssh %s --project %s --zone %s -- -L8888:127.0.0.1:8888", google_compute_instance.bastion.name, var.project, google_compute_instance.bastion.zone)
}

output "bastion_kubectl" {
  description = "kubectl command using the local proxy once the bastion_ssh command is running"
  value       = "HTTPS_PROXY=localhost:8888 kubectl get pods --all-namespaces"
}

output "bastion_ip" {
  value = google_compute_instance.bastion.network_interface.0.network_ip
}

output "secondary_ip_range" {
  value = google_compute_subnetwork.subnetwork.secondary_ip_range
}

output "network_self_link" {
  value = google_compute_network.network.self_link
}

output "subnetwork_self_link" {
  value = google_compute_subnetwork.subnetwork.self_link
}