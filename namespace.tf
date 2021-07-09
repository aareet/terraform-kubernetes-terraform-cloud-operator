resource "kubernetes_namespace" "namespace_operator" {
  count = var.create_namespace ? 1 : 0

  metadata {
    name = var.operator_namespace
  }
}


