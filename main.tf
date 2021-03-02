terraform {
  required_providers {
    kubernetes-alpha = {
      source  = "hashicorp/kubernetes-alpha"
      version = ">= 0.3.0"
    }
  }
}

provider "kubernetes-alpha" {
  config_path = "~/.kube/config" // path to kubeconfig
}
