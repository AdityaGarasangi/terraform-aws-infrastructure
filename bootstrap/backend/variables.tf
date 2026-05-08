# --- aws provider ---
variable "region" {
  type        = string
  description = "Region where backend resources are deployed"
}

# --- backend s3 bucket ---
variable "state_bucket_name" {
  type        = string
  description = "S3 bucket used to store terraform state file"
}
variable "state_bucket_tag" {
  type        = map(string)
  description = "Tags assigned to S3 bucket"
}

# --- backend dynamoDB ---
variable "locks_table_name" {
  type        = string
  description = "DyanamoDB used for terraform state locks"
}
variable "locks_table_tag" {
  type        = map(string)
  description = "Tags assigned to DynamoDB"
}