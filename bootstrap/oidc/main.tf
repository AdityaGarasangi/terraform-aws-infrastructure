# --- oidc provider ---
resource "aws_iam_openid_connect_provider" "github" {
  url             = "https://token.actions.githubusercontent.com"
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = ["6938fd4d98bab03faadb97b34396831e3780aea1"]

  tags = var.oidc_tags
}

# --- github actions dev role ---
resource "aws_iam_role" "guthub_actions_dev" {
  name = var.dev_role_name

  assume_role_policy = templatefile(
    "${path.module}/policies/dev_trust_policy.json",
    {
      github_provider_arn = aws_iam_openid_connect_provider.github.arn
      github_user         = var.github_user
      github_repo         = var.github_repo
    }
  )

  tags = var.oidc_tags
}

# --- dev permission policy ---
resource "aws_iam_policy" "dev_permission" {
  name = "github-actions-dev-policy"

  policy = templatefile(
    "${path.module}/policies/dev_permission_policy.json",
    {
      state_bucket_arn = var.state_bucket_arn
      lock_table_arn   = var.lock_table_arn
    }
  )

  tags = var.oidc_tags
}

# --- attach dev policy ---
resource "aws_iam_role_policy_attachment" "dev" {
  role       = aws_iam_role.guthub_actions_dev.name
  policy_arn = aws_iam_policy.dev_permission.arn
}

# --- github actions pord role ---
resource "aws_iam_role" "github_actions_prod" {
  name = var.prod_role_name

  assume_role_policy = templatefile(
    "${path.module}/policies/prod_trust_policy.json",
    {
      github_provider_arn = aws_iam_openid_connect_provider.github.arn
      github_user         = var.github_user
      github_repo         = var.github_repo
    }
  )

  tags = var.oidc_tags
}

# --- prod permission ---
resource "aws_iam_policy" "prod_permission" {
  name = "github-actions-prod-policy"

  policy = templatefile(
    "${path.module}/policies/prod_permission_policy.json",
    {
      state_bucket_arn = var.state_bucket_arn
      lock_table_arn   = var.lock_table_arn
    }
  )

  tags = var.oidc_tags
}

# --- attach prod policy ----
resource "aws_iam_role_policy_attachment" "prod" {
  role       = aws_iam_role.github_actions_prod.name
  policy_arn = aws_iam_policy.prod_permission.arn
}