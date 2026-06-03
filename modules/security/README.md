# Terraform Security Module

This module creates the core security groups required for the infrastructure.

## Resources Created

- ALB Security Group
- EC2 Security Group
- RDS PostgreSQL Security Group

## Security Design

### ALB Security Group
- Allows HTTP (80)
- Allows HTTPS (443)
- Publicly accessible

### EC2 Security Group
- Allows traffic only from ALB
- Supports restricted SSH access
- Intended for private subnet workloads

### RDS Security Group
- Allows PostgreSQL access only from EC2
- Not publicly accessible

## Notes

- Security groups follow least-privilege principles.
- EC2 instances should run in private subnets.
- RDS is isolated from direct internet exposure.