output "namespace" {
  value = kubernetes_manifest.deployment_operator_terraform_sync_workspace.object.metadata.namespace
}

output "name" {
  value = kubernetes_manifest.deployment_operator_terraform_sync_workspace.object.metadata.name
}
