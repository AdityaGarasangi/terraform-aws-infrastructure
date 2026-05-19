# --- internet gateway ---
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    local.network_tags,
    {
      Name = "${var.environment}-igw"
    }
  )
}

# --- eip for nat gateway ---
resource "aws_eip" "nat" {
  count = var.enable_nat_gateway ? 1 : 0

  domain = "vpc"

  tags = merge(
    local.network_tags,
    {
      Name = "${var.environment}-nat-eip"
    }
  )

  depends_on = [aws_internet_gateway.main]
}

# --- nat gateway ---
resource "aws_nat_gateway" "main" {
  count = var.enable_nat_gateway ? 1 : 0

  allocation_id = aws_eip.nat[0].id
  subnet_id     = aws_subnet.public[0].id

  tags = merge(
    local.network_tags,
    {
      Name = "${var.environment}-nat-gateway"
    }
  )

  depends_on = [aws_internet_gateway.main]
}