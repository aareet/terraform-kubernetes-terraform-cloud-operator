variable "operator_namespace" {
  type        = string
  description = "The namespace in which to install the operator and monitor for Workspaces."
}

variable "terraform_credentials_path" {
  type = string
  description = "Specify the path to the file that contains your Terraform Cloud Team API token"
}

variable "workspacesecrets" {
  type        = map(string)
  description = "https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret#data"
  default = {
  }
}

variable "create_namespace" {
  type = bool
  default = true
}

variable "create_secrets" {
  type        = bool
  description = "By default, module will create two secrets named terraformrc and workspacesecrets."
  default     = true
}
