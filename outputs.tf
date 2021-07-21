output "deployment_name" {
  value       = kubernetes_deployment.operator_terraform_sync_workspace.metadata[0].name
  description = "https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/deployment#name"
}

