# terraform-kubernetes-terraform-cloud-operator
This module uses the kubernetes provider, and the 0.3.0+ version of the kubernetes-alpha provider to install the Terraform Cloud Operator for Kubernetes.

By default, it creates a namespace and two secrets named terraformrc and workspacesecrets. The operator
is installed in that provided namespace.

An example configuration to use this module could be:
```
# main.tf
provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "kubernetes-alpha" {
  config_path = "~/.kube/config"
}

module "terraform-cloud-operator" {
  source  = "kunalvalia/terraform-cloud-operator/kubernetes"
  version = "0.0.1"

  operator_namespace = "demo"
  workspace_secrets = {
    AWS_ACCESS_KEY_ID     = var.aws_access_key_id
    AWS_SECRET_ACCESS_KEY = var.aws.secret_access_key
  }
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_kubernetes-alpha"></a> [kubernetes-alpha](#requirement\_kubernetes-alpha) | >= 0.3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | n/a |
| <a name="provider_kubernetes-alpha"></a> [kubernetes-alpha](#provider\_kubernetes-alpha) | >= 0.3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [kubernetes-alpha_kubernetes_manifest.customresourcedefinition_workspaces_app_terraform_io](https://registry.terraform.io/providers/hashicorp/kubernetes-alpha/latest/docs/resources/kubernetes_manifest) | resource |
| [kubernetes_cluster_role.operator_terraform_sync_workspace](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/cluster_role) | resource |
| [kubernetes_cluster_role_binding.operator_terraform_sync_workspace](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/cluster_role_binding) | resource |
| [kubernetes_deployment.operator_terraform_sync_workspace](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/deployment) | resource |
| [kubernetes_namespace.namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_role.operator_terraform_sync_workspace](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/role) | resource |
| [kubernetes_role_binding.operator_terraform_sync_workspace](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/role_binding) | resource |
| [kubernetes_secret.terraformrc](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |
| [kubernetes_secret.workspacesecrets](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |
| [kubernetes_service_account.operator_terraform_sync_workspace](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service_account) | resource |

## Inputs


| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_namespace"></a> [create\_namespace](#input\_create\_namespace) | By default, the module will create a namespace in which to install the operator. | `bool` | `true` | no |
| <a name="input_create_secrets"></a> [create\_secrets](#input\_create\_secrets) | By default, the module will create two secrets named terraformrc and workspacesecrets. | `bool` | `true` | no |
| <a name="input_image_k8s"></a> [image\_k8s](#input\_image\_k8s) | image\_k8s is the name (and tag) of the terraform-k8s Docker image that is used for functionality such as workspace sync. This can be overridden per component. | `string` | `"hashicorp/terraform-k8s:1.0.0"` | no |
| <a name="input_insecure"></a> [insecure](#input\_insecure) | If true it disables certificate validation for all outbound HTTPS connection the operator has to do. It can be used when connecting to TFE instances with self-signed certificates. | `bool` | `false` | no |
| <a name="input_k8_watch_namespace"></a> [k8\_watch\_namespace](#input\_k8\_watch\_namespace) | k8\_watch\_namespace is the Kubernetes namespace to watch for workspace changes and sync to Terraform Cloud. If this is not set then it will default to the release namespace. | `string` | `"null"` | no |
| <a name="input_log_level"></a> [log\_level](#input\_log\_level) | WARNING: use only on terraform-k8s versions > 1.0.0. Configure zap optional flag to adjust log level verbosity. Can be one of 'debug', 'info', 'error'. Defaults to 'debug'. | `string` | `"null"` | no |
| <a name="input_operator_namespace"></a> [operator\_namespace](#input\_operator\_namespace) | The namespace in which to install the operator and monitor for Workspaces. | `string` | n/a | yes |
| <a name="input_terraform_credentials_path"></a> [terraform\_credentials\_path](#input\_terraform\_credentials\_path) | Specify the relative path to the file that contains your Terraform Cloud Team API token. | `string` | `"credentials"` | no |
| <a name="input_terraform_version"></a> [terraform\_version](#input\_terraform\_version) | terraformVersion describes the version of Terraform to use for each workspace. If this is not set then it will default to the latest version of Terraform compiled with the operator. | `string` | `"latest"` | no |
| <a name="input_tfe_address"></a> [tfe\_address](#input\_tfe\_address) | tfe\_address denotes the address in the form of https://tfe.local for a Terraform Enterprise instance. If this is not set then it will default to Terraform Cloud (https://app.terraform.io). | `string` | `"https://app.terraform.io"` | no |
| <a name="input_workspace_secrets"></a> [workspace\_secrets](#input\_workspace\_secrets) | https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret#data | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_deployment_name"></a> [deployment\_name](#output\_deployment\_name) | https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/deployment#name |
