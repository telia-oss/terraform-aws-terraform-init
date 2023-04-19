## Terraform init

[![latest release](https://img.shields.io/github/v/release/telia-oss/terraform-aws-terraform-init?style=flat-square)](https://github.com/telia-oss/terraform-aws-terraform-init/releases/latest)
[![build status](https://img.shields.io/github/actions/workflow/status/telia-oss/terraform-aws-terraform-init/main.yml?branch=master&logo=github&style=flat-square)](https://github.com/telia-oss/terraform-aws-terraform-init/actions/workflows/main.yml)

A module for setting up a state bucket, lock table and KMS key on AWS. These resources should never be deleted, so storing state
for this deployment is not strictly necessary. Creates the following resources:

- [State bucket](https://www.terraform.io/docs/providers/aws/r/s3_bucket.html) with versioning enabled.
- [Lock table](https://www.terraform.io/docs/providers/aws/r/dynamodb_table.html) with the correct schema.
- [Encryption key](https://www.terraform.io/docs/providers/aws/r/kms_key.html) with KMS key alias.
