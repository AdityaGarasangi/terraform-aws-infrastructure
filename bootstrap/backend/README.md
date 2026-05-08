# Terraform Backend Bootstrap

This module sets up the backend infrastructure required for storing Terraform state remotely in AWS.

It creates:
- an S3 bucket for Terraform state files
- a DynamoDB table for state locking

This is the first piece of infrastructure that needs to be created before the main environments (`dev` and `prod`) can use remote state safely.

## What's Included

### S3 Bucket
The S3 bucket is used to store Terraform state files remotely instead of keeping them locally.

Additional protections included:
- versioning enabled for state recovery
- server-side encryption enabled
- public access fully blocked
- `prevent_destroy` enabled to avoid accidental deletion

### DynamoDB Table
The DynamoDB table is used for Terraform state locking.

This prevents multiple Terraform operations from running at the same time and helps avoid state corruption.

## Why This Exists

Terraform cannot use an S3 backend until the backend resources themselves already exist.

Because of that, this module is applied first using local Terraform state. Once created, the rest of the infrastructure can safely switch to remote state management.

## Notes

- This module is intended to be created once and reused.
- Avoid destroying backend resources after environments start using them.
- Remote state is shared between environments using separate state keys.

## Related Environments

- `environments/dev`
- `environments/prod`