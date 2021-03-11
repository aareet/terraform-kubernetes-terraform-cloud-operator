resource "kubernetes_manifest" "serviceaccount_operator_terraform_sync_workspace" {
  provider = kubernetes-alpha

  manifest = {
    "apiVersion" = "v1"
    "kind"       = "ServiceAccount"
    "metadata" = {
      "labels" = {
        "app"     = "terraform"
        "release" = "operator"
      }
      "name"      = "operator-terraform-sync-workspace"
      "namespace" = kubernetes_manifest.namespace_operator.object.metadata.name 
    }
  }
}
