This module uses the 0.3.0+ version of the kubernetes-alpha provider to install the Terraform Cloud Operator for Kubernetes.

It requires you to specify the namespace and assumes that the namespace exists and has two secrets created `terraformrc` containing your Terraform Cloud Team API token and `workspacesecrets` containing any secrets you want configured in your workspace.

An example configuration to use this module could be:
```
module "terraform-cloud-operator" {
  source  = "aareet/terraform-cloud-operator/kubernetes"
  version = "0.0.1"
  operator_namespace = "demo"
}

provider "kubernetes-alpha" {
  config_path = "/home/aareet/.kube/config"
}
```
