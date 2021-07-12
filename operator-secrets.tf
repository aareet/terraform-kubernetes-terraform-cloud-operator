resource "kubernetes_secret" "terraformrc" {
  depends_on = [kubernetes_namespace.namespace_operator]
  count = var.create_secrets ? 1 : 0

  metadata {
    name      = "terraformrc"
    namespace = var.operator_namespace
  }

  data = {
    "credentials" = "${file("${var.terraform_credentials_path}")}"
  }

}

resource "kubernetes_secret" "workspacesecrets" {
  depends_on = [kubernetes_namespace.namespace_operator]
  count = var.create_secrets ? 1 : 0

  metadata {
    name      = "workspacesecrets"
    namespace = var.operator_namespace
  }

  data = var.workspacesecrets

}
