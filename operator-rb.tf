resource "kubernetes_role_binding" "rolebinding_operator_terraform_sync_workspace" {
  metadata {
    name      = "operator-terraform-sync-workspace"
    namespace = var.operator_namespace
    labels = {
      app     = "terraform"
      release = "operator"
    }
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"
    name      = "operator-terraform-sync-workspace"
  }
  subject {
    kind      = "ServiceAccount"
    name      = "operator-terraform-sync-workspace"
    namespace = var.operator_namespace
  }
}
