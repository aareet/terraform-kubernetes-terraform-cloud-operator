variable "operator_namespace" {
  type        = string
  description = "The namespace in which to install the operator and monitor for Workspaces."
}

variable "terraform_credentials_path" {
  type = string
  description = "Specify the path to the file that contains your Terraform Cloud Team API token"
}

variable "workspacesecrets" {
  type = string
  description = "Specify any secrets you want added to your Terraform Cloud workspace"
  default = "value"
}

variable "create_namespace" {
  type = bool
  default = true
}
