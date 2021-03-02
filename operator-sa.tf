resource "kubernetes_manifest" "serviceaccount_operator_terraform_sync_workspace" {
  provider = kubernetes-alpha

  manifest = {
    "apiVersion" = "v1"
    "kind" = "ServiceAccount"
    "metadata" = {
      "annotations" = {
        "meta.helm.sh/release-name" = "operator"
        "meta.helm.sh/release-namespace" = "demo"
      }
      "labels" = {
        "app" = "terraform"
        "app.kubernetes.io/managed-by" = "Helm"
        "chart" = "terraform-helm"
        "heritage" = "Helm"
        "release" = "operator"
      }
      "name" = "operator-terraform-sync-workspace"
      "namespace" = "demo"
    }
    "secrets" = [
      {
        "name" = "operator-terraform-sync-workspace-token-x2btb"
      },
    ]
  }
}
