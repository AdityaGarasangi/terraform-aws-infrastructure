# --- aws region ---
variable "region" {
  type        = string
  description = "Region where oidc configurations are deployed"
}

# --- oidc provider ---
variable "oidc_tags" {
  type        = map(string)
  description = "Tags for OIDC"
}

# --- dev role ---
variable "dev_role_name" {
  type        = string
  description = "Name of dev role given to github actions"
}

# --- prod role ---
variable "prod_role_name" {
  type        = string
  description = "Name of prod role given to github actions"
}

# --- permissions ---
variable "state_bucket_arn" {
  type        = string
  description = "backend s3 bucket arn"
}
variable "lock_table_arn" {
  type        = string
  description = "backend dynamoDB lock table arn"
}

# --- github creds ---
variable "github_user" {
  type        = string
  description = "GitHub username to aceess required repo"
}
variable "github_repo" {
  type        = string
  description = "Repo name which is to be deployed"
}

