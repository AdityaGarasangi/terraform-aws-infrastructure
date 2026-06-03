# --- alb security groups ---
output "alb_security_group_id" {
  value       = aws_security_group.alb.id
  description = "ID of Application Load Balancer Security Group"
}

# --- ec2 security group ---
output "ec2_security_group_id" {
  value       = aws_security_group.ec2.id
  description = "ID of EC2 Security Group"
}

# --- rds security group ---
output "rds_security_group_id" {
  value       = aws_security_group.rds.id
  description = "ID of RDS Security Group"
}