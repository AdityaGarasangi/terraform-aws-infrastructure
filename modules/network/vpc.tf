# --- vpc ---
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = merge(
    local.network_tags, {
      Name = var.vpc_name
    }
  )
}