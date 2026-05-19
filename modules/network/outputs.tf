# --- vpc ---
output "vpc_id" {
  value       = aws_vpc.main.id
  description = "VPC ID"
}
output "vpn_arn" {
  value       = aws_vpc.main.arn
  description = "VPC ARN"
}

# --- public subnet ---
output "public_subnet_ids" {
  value       = aws_subnet.public[*].id
  description = "Public Subnet IDs"
}

# --- private subnet ---
output "private_subnet_ids" {
  value       = aws_subnet.private[*].id
  description = "Private Subnet IDs"
}

# --- internet gateway --- 
output "internet_gateway_id" {
  value       = aws_internet_gateway.main.id
  description = "Internet Gateway ID"
}

# --- nat gateway ---
output "nat_gateway_id" {
  value       = aws_nat_gateway.main[*].id
  description = "NAT Gateway ID"
}

# --- public route table ---
output "public_route_table_id" {
  value       = aws_route_table.public.id
  description = "Public Route table ID"
}

# --- private route table ---
output "private_route_table_id" {
  value       = var.enable_nat_gateway ? aws_route_table.private[*].id : null
  description = "Private Route table ID"
}