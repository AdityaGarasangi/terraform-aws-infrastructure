locals {
  security_tags = {
    Project     = "Terraform AWS Infrastructure"
    Environment = var.environment
    Module      = "Network"
    ManagedBy   = "Terraform"
  }
}