## Terraform init

[![workflow](https://github.com/telia-oss/terraform-aws-terraform-init/workflows/workflow/badge.svg)](https://github.com/telia-oss/terraform-aws-terraform-init/actions)

A module for setting up a state bucket, lock table and KMS key on AWS. These resources should never be deleted, so storing state
for this deployment is not strictly necessary. Creates the following resources:

- [State bucket](https://www.terraform.io/docs/providers/aws/r/s3_bucket.html) with versioning enabled.
- [Lock table](https://www.terraform.io/docs/providers/aws/r/dynamodb_table.html) with the correct schema.
- [Encryption key](https://www.terraform.io/docs/providers/aws/r/kms_key.html) with KMS key alias.
