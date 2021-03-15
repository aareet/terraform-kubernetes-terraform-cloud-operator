resource "kubernetes_secret" "terraformrc" {
  metadata {
    name = "terraformrc"
    namespace = kubernetes_manifest.namespace_operator.object.metadata.name
  }

  data = {
    "credentials" = "${file("${var.terraform_credentials_path}")}"
  }
}

resource "kubernetes_secret" "workspacesecrets" {
  metadata {
    name = "workspacesecrets"
    namespace = kubernetes_manifest.namespace_operator.object.metadata.name
  }

  data = {
    key = var.workspacesecrets
  }
}
