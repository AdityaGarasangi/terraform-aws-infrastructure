# --- public subnet ---
resource "aws_subnet" "public" {
  count = length(var.public_subnet_cidrs)

  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidrs[count.index]
  availability_zone       = var.availability_zone[count.index]
  map_public_ip_on_launch = true

  tags = merge(
    local.network_tags,
    {
      Name = "${var.environment}-public-subnet-${count.index + 1}"
      Type = "Public"

    }
  )
}

# --- private subnet ---
resource "aws_subnet" "private" {
  count = length(var.private_subnet_cidrs)

  vpc_id            = aws_vpc.main
  cidr_block        = var.private_subnet_cidrs[count.index]
  availability_zone = var.availability_zone[count.index]

  tags = merge(
    local.network_tags,
    {
      Name = "${var.environment}-private-subent-${count.index + 1}"
      Type = "Private"
    }
  )
}