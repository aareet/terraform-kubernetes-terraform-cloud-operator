resource "kubernetes_manifest" "rolebinding_operator_terraform_sync_workspace" {
  provider = kubernetes-alpha
  depends_on = [kubernetes_manifest.deployment_operator_terraform_sync_workspace]

  manifest = {
    "apiVersion" = "rbac.authorization.k8s.io/v1"
    "kind"       = "RoleBinding"
    "metadata" = {
      "labels" = {
        "app"     = "terraform"
        "release" = "operator"
      }
      "name"      = "operator-terraform-sync-workspace"
      "namespace" = var.operator_namespace
    }
    "roleRef" = {
      "apiGroup" = "rbac.authorization.k8s.io"
      "kind"     = "Role"
      "name"     = "operator-terraform-sync-workspace"
    }
    "subjects" = [
      {
        "kind" = "ServiceAccount"
        "name" = "operator-terraform-sync-workspace"
      },
    ]
  }
}
