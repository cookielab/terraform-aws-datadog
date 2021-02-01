resource "aws_cloudformation_stack" "datadog_forwarder" {
  name         = "datadog"
  capabilities = ["CAPABILITY_IAM", "CAPABILITY_NAMED_IAM", "CAPABILITY_AUTO_EXPAND"]
  parameters   = {
    ExternalId                = var.external_id
    DdApiKey                  = var.api_key
    DdSite                    = var.site
    LogArchives               = var.log_archives
    CloudTrails               = var.cloud_trails
    IAMRoleName               = var.iam_role_name
    Permissions               = var.permissions
    DdAWSAccountId            = var.aws_account_id
    DdForwarderName           = var.forwarder_name
    InstallDatadogPolicyMacro = var.install_policy_makro
  }
  template_url = "https://datadog-cloudformation-template.s3.amazonaws.com/aws/main.yaml"
}

data "aws_caller_identity" "current" {}

data "aws_region" "current" {}
