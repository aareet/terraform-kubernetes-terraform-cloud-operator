resource "kubernetes_manifest" "namespace_operator" {
  provider = kubernetes-alpha
  count = var.create_namespace ? 1 : 0

  manifest = {
    "apiVersion" = "v1"
    "kind"       = "Namespace"
    "metadata" = {
      "name" = var.operator_namespace
    }
  }
}
