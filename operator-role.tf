resource "kubernetes_manifest" "role_operator_terraform_sync_workspace" {
  provider = kubernetes-alpha

  manifest = {
    "apiVersion" = "rbac.authorization.k8s.io/v1"
    "kind" = "Role"
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
