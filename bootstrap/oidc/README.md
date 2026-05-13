# Terraform OIDC Bootstrap

This module bootstraps GitHub Actions OIDC authentication for AWS.

It creates:
- GitHub OIDC provider
- IAM roles for DEV and PROD environments
- IAM policies for Terraform backend access
- Secure trust relationships between GitHub and AWS

## Purpose

This setup allows GitHub Actions to securely authenticate with AWS using temporary credentials instead of long-lived access keys.

## Security Features

- Separate IAM roles for DEV and PROD
- Branch-restricted role assumption
- Least privilege IAM policies
- No static AWS credentials
- Isolated Terraform state access per environment

## Notes

- Applied only once per AWS account
- Uses a shared backend bucket with isolated state paths
- Designed for directory-based environment isolation

## Related Components

- `bootstrap/backend`
- `environments/dev`
- `environments/prod`