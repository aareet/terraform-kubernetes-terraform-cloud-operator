resource "kubernetes_manifest" "serviceaccount_operator_terraform_sync_workspace" {
  provider = kubernetes-alpha
  depends_on = [kubernetes_manifest.deployment_operator_terraform_sync_workspace]

  manifest = {
    "apiVersion" = "v1"
    "kind"       = "ServiceAccount"
    "metadata" = {
      "labels" = {
        "app"     = "terraform"
        "release" = "operator"
      }
      "name"      = "operator-terraform-sync-workspace"
      "namespace" = var.operator_namespace
    }
  }
}
