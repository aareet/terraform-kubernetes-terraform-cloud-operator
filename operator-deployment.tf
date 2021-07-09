resource "kubernetes_manifest" "deployment_operator_terraform_sync_workspace" {
  provider   = kubernetes-alpha
  depends_on = [kubernetes_secret.terraformrc, kubernetes_secret.workspacesecrets]

  manifest = {
    "apiVersion" = "apps/v1"
    "kind"       = "Deployment"
    "metadata" = {
      "labels" = {
        "app"     = "terraform"
        "release" = "operator"
      }
      "name"      = "operator-terraform-sync-workspace"
      "namespace" = var.operator_namespace
    }
    "spec" = {
      "progressDeadlineSeconds" = 600
      "replicas"                = 1
      "revisionHistoryLimit"    = 10
      "selector" = {
        "matchLabels" = {
          "app"       = "terraform"
          "component" = "sync-workspace"
          "release"   = "operator"
        }
      }
      "strategy" = {
        "rollingUpdate" = {
          "maxSurge"       = "25%"
          "maxUnavailable" = "25%"
        }
        "type" = "RollingUpdate"
      }
      "template" = {
        "metadata" = {
          "labels" = {
            "app"       = "terraform"
            "component" = "sync-workspace"
            "release"   = "operator"
          }
        }
        "spec" = {
          "containers" = [
            {
              "args" = [
                "--enable-leader-election",
                "--k8s-watch-namespace=${var.k8WatchNamespace == "null" ? var.operator_namespace : var.k8WatchNamespace}"
              ]
              "command" = [
                "/bin/terraform-k8s",
              ]
              "env" = [
                {
                  "name" = "POD_NAME"
                  "valueFrom" = {
                    "fieldRef" = {
                      "apiVersion" = "v1"
                      "fieldPath"  = "metadata.name"
                    }
                  }
                },
                {
                  "name"  = "OPERATOR_NAME"
                  "value" = "terraform-k8s"
                },
                {
                  "name"  = "TF_VERSION"
                  "value" = "latest"
                },
                {
                  "name"  = "TF_CLI_CONFIG_FILE"
                  "value" = "/etc/terraform/.terraformrc"
                },
                {
                  "name" = "TF_URL"
                },
              ]
              "image"           = "hashicorp/terraform-k8s:1.0.0"
              "imagePullPolicy" = "IfNotPresent"
              "livenessProbe" = {
                "failureThreshold" = 3
                "httpGet" = {
                  "path"   = "/metrics"
                  "port"   = 8383
                  "scheme" = "HTTP"
                }
                "initialDelaySeconds" = 30
                "periodSeconds"       = 5
                "successThreshold"    = 1
                "timeoutSeconds"      = 5
              }
              "name" = "terraform-sync-workspace"
              "readinessProbe" = {
                "failureThreshold" = 5
                "httpGet" = {
                  "path"   = "/metrics"
                  "port"   = 8383
                  "scheme" = "HTTP"
                }
                "initialDelaySeconds" = 10
                "periodSeconds"       = 5
                "successThreshold"    = 1
                "timeoutSeconds"      = 5
              }
              "resources"                = {}
              "terminationMessagePath"   = "/dev/termination-log"
              "terminationMessagePolicy" = "File"
              "volumeMounts" = [
                {
                  "mountPath" = "/etc/terraform"
                  "name"      = "terraformrc"
                  "readOnly"  = true
                },
                {
                  "mountPath" = "/tmp/secrets"
                  "name"      = "sensitivevars"
                  "readOnly"  = true
                },
              ]
            },
          ]
          "dnsPolicy"                     = "ClusterFirst"
          "restartPolicy"                 = "Always"
          "schedulerName"                 = "default-scheduler"
          "serviceAccount"                = "operator-terraform-sync-workspace"
          "serviceAccountName"            = "operator-terraform-sync-workspace"
          "terminationGracePeriodSeconds" = 30
          "volumes" = [
            {
              "name" = "terraformrc"
              "secret" = {
                "items" = [
                  {
                    "key"  = "credentials"
                    "path" = ".terraformrc"
                  },
                ]
                "secretName" = "terraformrc"
              }
            },
            {
              "name" = "sensitivevars"
              "secret" = {
                "secretName" = "workspacesecrets"
              }
            },
          ]
        }
      }
    }
  }
}
