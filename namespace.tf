resource "kubernetes_manifest" "namespace_operator" {
  provider = kubernetes-alpha

  manifest = {
    "apiVersion" = "v1"
    "kind"       = "Namespace"
    "metadata" = {
      "name" = var.operator_namespace
    }
  }
}
