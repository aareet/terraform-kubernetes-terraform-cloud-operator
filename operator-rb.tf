resource "kubernetes_manifest" "rolebinding_operator_terraform_sync_workspace" {
  provider = kubernetes-alpha

  manifest = {
    "apiVersion" = "rbac.authorization.k8s.io/v1"
    "kind" = "RoleBinding"
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
    "roleRef" = {
      "apiGroup" = "rbac.authorization.k8s.io"
      "kind" = "Role"
      "name" = "operator-terraform-sync-workspace"
    }
    "subjects" = [
      {
        "kind" = "ServiceAccount"
        "name" = "operator-terraform-sync-workspace"
      },
    ]
  }
}
