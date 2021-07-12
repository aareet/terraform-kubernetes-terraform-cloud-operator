variable "operator_namespace" {
  type        = string
  description = "The namespace in which to install the operator and monitor for Workspaces."
}

variable "terraform_credentials_path" {
  type        = string
  description = "Specify the path to the file that contains your Terraform Cloud Team API token"
}

variable "workspacesecrets" {
  type        = map(string)
  description = "https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret#data"
  default = {
  }
}

variable "create_namespace" {
  type    = bool
  default = true
}

variable "create_secrets" {
  type        = bool
  description = "By default, module will create two secrets named terraformrc and workspacesecrets."
  default     = true
}

variable "k8WatchNamespace" {
  type    = string
  default = "null"
}

variable "terraformVersion" {
  type        = string
  description = "https://github.com/hashicorp/terraform-helm/blob/master/values.yaml#L41"
  default     = "latest"
}

variable "insecure" {
  type = bool
  default = false
}

variable "tfeAddress" {
  type = string
  default = "https://app.terraform.io"
}

variable "imageK8S" {
  type = string
  default = "hashicorp/terraform-k8s:1.0.0"
}
