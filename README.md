# Jenkins X 3.x GitOps Repository for GKE, Terraform and Vault

This git repository setups the cloud resources required to run Jenkins X on GKE via Terraform and then sets up Jenkins X with Vault.

## Prerequisites

We assume you have access to GCP and have modified the `main.mf` file to add your GCP project ID.

## Creating/upgrading cloud resources

Run the `./bin/apply.sh` script to generate the terraform resources and modify the `jx-requirements.yml` file

Now git commit and push any changes...

```bash 
git add *
git commit -a -m "chore: regenerated terraform"
```

# Proxy

```
gcloud compute ssh dev-bastion --project {project} --zone europe-west1-c --  -L8888:127.0.0.1:8888
HTTPS_PROXY=localhost:8888 terraform apply
HTTPS_PROXY=localhost:8888 kubectl get pods --all-namespaces
```

