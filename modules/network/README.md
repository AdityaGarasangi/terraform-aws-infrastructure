# Terraform Network Module

This module creates the foundational AWS networking infrastructure for the project.

## Resources Created

- VPC
- Public and private subnets
- Internet Gateway
- NAT Gateway
- Route tables and associations
- Elastic IP for NAT Gateway

## Features

- Multi-AZ subnet architecture
- Public and private subnet separation
- Optional NAT Gateway support
- Reusable and environment-aware design
- Standardized resource tagging

## Notes

- Public subnets are used for internet-facing resources.
- Private subnets are intended for internal workloads.
- NAT Gateway is deployed in the first public subnet.

## Related Components

- `modules/compute`
- `modules/database`
- `modules/loadbalancer`