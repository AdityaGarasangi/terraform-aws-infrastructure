# --- aws provider ---
variable "region" {
  type        = string
  description = "Region of aws where network resoruces are deployed"
}

# --- environment ---
variable "environment" {
  type        = string
  description = "Environment Name"

  validation {
    condition     = contains(["dev", "prod"], var.environment)
    error_message = "Environment must be either dev or prod"
  }
}

# --- vpc ---
variable "vpc_name" {
  type        = string
  description = "Name of the VPC"
}
variable "vpc_cidr" {
  type        = string
  description = "CIDR block for VPC"
}

# --- public subnet ---
variable "public_subnet_cidrs" {
  type        = list(string)
  description = "CIDR blocks for public subnets"
}

# --- private subent ---
variable "private_subnet_cidrs" {
  type        = list(string)
  description = "CIDR blocks for private subnets"
}

# --- availability zone ---
variable "availability_zone" {
  type        = list(string)
  description = "Availability zones for subnets"
}

# --- eip for nat gateway ---
variable "enable_nat_gateway" {
  type        = bool
  description = "Enable NAT Gateway"
  default     = true
}