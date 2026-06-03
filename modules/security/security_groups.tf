# --- alb security group ---
resource "aws_security_group" "alb" {
  name        = "${var.environment}-alb-sg"
  description = "Security Groups for Applications Load Balancer"

  vpc_id = var.vpc_id

  tags = merge(
    local.security_tags,
    {
      Name = "${var.environment}-alb-sg"
    }
  )
}

# --- alb ingress & egress rules ---
resource "aws_vpc_security_group_ingress_rule" "alb_http" {
  security_group_id = aws_security_group.alb.id

  description = "Allow HTTP traffic"

  from_port   = 80
  to_port     = 80
  ip_protocol = "tcp"

  cidr_ipv4 = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "alb_https" {
  security_group_id = aws_security_group.alb.id

  description = "Allow HTTPS traffic"

  from_port   = 443
  to_port     = 443
  ip_protocol = "tcp"

  cidr_ipv4 = "0.0.0.0/0"
}

resource "aws_vpc_security_group_egress_rule" "alb__egress" {
  security_group_id = aws_security_group.alb.id

  ip_protocol = "-1"

  cidr_ipv4 = "0.0.0.0/0"
}

# --- ec2 security groups ---
resource "aws_security_group" "ec2" {
  name        = "${var.environment}-ec2-sg"
  description = "Security Groups for EC2"
  vpc_id      = var.vpc_id

  tags = merge(
    local.security_tags,
    {
      Name = "${var.environment}-ec2-sg"
    }
  )
}

# --- ec2 ingress & engree rules ---
resource "aws_vpc_security_group_ingress_rule" "ec2_http_from_alb" {
  security_group_id = aws_security_group.ec2.id

  description = "Allow HTTP from ALB"

  from_port   = 80
  to_port     = 80
  ip_protocol = "tcp"

  referenced_security_group_id = aws_security_group.alb.id
}

resource "aws_vpc_security_group_ingress_rule" "ec2_https_from_alb" {
  security_group_id = aws_security_group.ec2.id

  description = "Allow HTTPS from ALB"

  from_port   = 443
  to_port     = 443
  ip_protocol = "tcp"

  referenced_security_group_id = aws_security_group.alb.id
}

resource "aws_vpc_security_group_ingress_rule" "ec2_ssh" {
  security_group_id = aws_security_group.ec2.id

  description = "Allow SSH access"

  from_port   = 22
  to_port     = 22
  ip_protocol = "tcp"

  cidr_ipv4 = var.allowed_ssh_cidr
}

resource "aws_vpc_security_group_egress_rule" "ec2_egress" {
  security_group_id = aws_security_group.ec2.id

  ip_protocol = "-1"

  cidr_ipv4 = "0.0.0.0/0"
}

# --- rds security groups ---
resource "aws_security_group" "rds" {
  name        = "${var.environment}-rds-sg"
  description = "Security Groups of PostgreSQL"
  vpc_id      = var.vpc_id

  tags = merge(
    local.security_tags,
    {
      Name = "${var.environment}-rds-sg"
    }
  )
}

# --- postgreSQL ingress & egress rules ---
resource "aws_vpc_security_group_ingress_rule" "rds_postgres_from_ec2" {
  security_group_id = aws_security_group.rds.id

  description = "Allow PostgreSQL from EC2"

  from_port   = 5432
  to_port     = 5432
  ip_protocol = "tcp"

  referenced_security_group_id = aws_security_group.ec2.id
}

resource "aws_vpc_security_group_ingress_rule" "rds_egress" {
  security_group_id = aws_security_group.rds.id

  ip_protocol = "-1"

  cidr_ipv4 = "0.0.0.0/0"
}
