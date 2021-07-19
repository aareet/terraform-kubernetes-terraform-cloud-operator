resource "kubernetes_service_account" "serviceaccount_operator_terraform_sync_workspace" {
  metadata {
    name      = "operator-terraform-sync-workspace"
    namespace = var.operator_namespace
    labels = {
      app     = "terraform"
      release = "operator"
    }
  }
}
