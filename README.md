This module uses the 0.3.0+ version of the kubernetes-alpha provider to install the Terraform Cloud Operator for Kubernetes.

It requires you to specify the namespace and assumes that the namespace exists and has two secrets created `terraformrc` containing your Terraform Cloud Team API token and `workspacesecrets` containing any secrets you want configured in your workspace.
