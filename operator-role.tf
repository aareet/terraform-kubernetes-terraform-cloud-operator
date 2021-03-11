resource "kubernetes_manifest" "role_operator_terraform_sync_workspace" {
  provider = kubernetes-alpha

  manifest = {
    "apiVersion" = "rbac.authorization.k8s.io/v1"
    "kind"       = "Role"
    "metadata" = {
      "labels" = {
        "app"     = "terraform"
        "release" = "operator"
      }
      "name"      = "operator-terraform-sync-workspace"
      "namespace" = kubernetes_manifest.namespace_operator.object.metadata.name 
    }
    "rules" = [
      {
        "apiGroups" = [
          "",
        ]
        "resources" = [
          "pods",
          "services",
          "services/finalizers",
          "endpoints",
          "persistentvolumeclaims",
          "events",
          "configmaps",
          "secrets",
        ]
        "verbs" = [
          "*",
        ]
      },
      {
        "apiGroups" = [
          "",
        ]
        "resources" = [
          "configmaps/status",
        ]
        "verbs" = [
          "get",
          "update",
          "patch",
        ]
      },
      {
        "apiGroups" = [
          "apps",
        ]
        "resources" = [
          "deployments",
          "daemonsets",
          "replicasets",
          "statefulsets",
        ]
        "verbs" = [
          "*",
        ]
      },
      {
        "apiGroups" = [
          "monitoring.coreos.com",
        ]
        "resources" = [
          "servicemonitors",
        ]
        "verbs" = [
          "get",
          "create",
        ]
      },
      {
        "apiGroups" = [
          "apps",
        ]
        "resourceNames" = [
          "terraform-k8s",
        ]
        "resources" = [
          "deployments/finalizers",
        ]
        "verbs" = [
          "update",
        ]
      },
      {
        "apiGroups" = [
          "",
        ]
        "resources" = [
          "pods",
        ]
        "verbs" = [
          "get",
        ]
      },
      {
        "apiGroups" = [
          "apps",
        ]
        "resources" = [
          "replicasets",
        ]
        "verbs" = [
          "get",
        ]
      },
      {
        "apiGroups" = [
          "app.terraform.io",
        ]
        "resources" = [
          "*",
          "workspaces",
        ]
        "verbs" = [
          "*",
        ]
      },
    ]
  }
}
