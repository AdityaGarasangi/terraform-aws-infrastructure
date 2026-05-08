# --- aws provider ---
output "region" {
  value       = var.region
  description = "Region where backend resouces are deployed"
}

# --- s3 bucket ---
output "state_bucket_id" {
  value       = aws_s3_bucket.terraform_state.id
  description = "S3 bucket used for terraform state file"
}

output "state_bucket_arn" {
  value       = aws_s3_bucket.terraform_state.arn
  description = "ARN of s3 bucket"
}

# --- dynamoDB ---
output "locks_table_id" {
  value       = aws_dynamodb_table.terraform_locks.id
  description = "DynamoDB used for terraform state locks"
}

output "locks_table_arn" {
  value       = aws_dynamodb_table.terraform_locks.arn
  description = "ARN of dyanamoDB"
}