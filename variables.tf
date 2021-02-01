variable "api_key" {
  type        = string
  sensitive   = true
  description = "API key for the Datadog account (find at https://app.datadoghq.com/account/settings#api)"
}

variable "external_id" {
  type        = string
  description = "External ID for the Datadog role (generate at https://app.datadoghq.com/account/settings#integrations/amazon-web-services)"
}

variable "site" {
  type        = string
  description = "Define your Datadog Site to send data to. For the Datadog EU site, set to datadoghq.eu"
  default     = "datadoghq.com"
}

variable "log_archives" {
  type        = string
  description = "S3 paths to store log archives for log rehydration. Separate multiple paths with comma, e.g., \"my-bucket,my-bucket-with-path/path\". Permissions will be automatically added to the Datadog integration IAM role. https://docs.datadoghq.com/logs/archives/rehydrating/?tab=awss3"
  default     = null
}

variable "cloud_trails" {
  type        = string
  description = "S3 buckets for Datadog CloudTrail integration. Separate multiple buckets with comma, e.g., \"bucket1,bucket2\". Permissions will be automatically added to the Datadog integration IAM role. https://docs.datadoghq.com/integrations/amazon_cloudtrail/"
  default     = null
}

variable "iam_role_name" {
  type        = string
  description = "Customize the name of IAM role for Datadog AWS integration"
  default     = "DatadogIntegrationRole"
}

variable "permissions" {
  type        = string
  description = "Customize the permission level for the Datadog IAM role. Select \"Core\" to only grant Datadog read-only permissions (not recommended)."
  default     = "Full"
}

variable "aws_account_id" {
  type        = number
  description = "Datadog AWS account ID allowed to assume the integration IAM role. DO NOT CHANGE!"
  default     = 464622532012
}

variable "forwarder_name" {
  type        = string
  description = "The Datadog Forwarder Lambda function name. DO NOT change when updating an existing CloudFormation stack, otherwise the current forwarder function will be replaced and all the triggers will be lost."
  default     = "DatadogForwarder"
}

variable "install_policy_makro" {
  type        = bool
  description = "If you already deployed a stack using this template, set this parameter to false to skip the installation of the DatadogPolicy Macro again."
  default     = true
}
