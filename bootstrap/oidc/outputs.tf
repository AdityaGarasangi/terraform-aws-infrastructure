# --- aws provider ---
output "region" {
  value       = var.region
  description = "Region where oidc configurations are deployed"
}

output "github_dev_role_arn" {
  value       = aws_iam_role.guthub_actions_dev.arn
  description = "IAM role ARN for GitHub Actions dev"
}

output "github_prod_role_arn" {
  value       = aws_iam_role.github_actions_prod.arn
  description = "IAM role ARN for GitHub Actions prod"
}

output "github_oidc_provider_arn" {
  value       = aws_iam_openid_connect_provider.github.arn
  description = "GitHub OIDC provider ARN"
}

