resource "kubernetes_secret" "terraformrc" {
  metadata {
    name = "terraformrc"
    namespace = var.operator_namespace
  }

  data = {
    "credentials" = "${file("${var.terraform_credentials_path}")}"
  }

}

resource "kubernetes_secret" "workspacesecrets" {
  metadata {
    name = "workspacesecrets"
    namespace = var.operator_namespace
  }

  data = {
    key = var.workspacesecrets
  }

}
