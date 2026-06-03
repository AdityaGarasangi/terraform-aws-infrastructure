# --- aws ---
variable "region" {
  type        = string
  description = "AWS Region"
}

# --- environment ---
variable "environment" {
  type        = string
  description = "Environment"

  validation {
    condition     = contains(["dev", "prod"], var.environment)
    error_message = "Environment must be either dev or prod"
  }
}

# --- alb ---
variable "vpc_id" {
  type        = string
  description = "VPC ID of Application Load Balancer"
}

# --- ec2 ---
variable "allowed_ssh_cidr" {
  type        = string
  description = "Allowed SSH CIDRs"
}
