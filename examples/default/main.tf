terraform {
  required_version = "0.11.11"

  backend "s3" {
    key            = "terraform-modules/development/terraform-aws-terraform-init/default.tfstate"
    bucket         = "<test-account-id>-terraform-state"
    dynamodb_table = "<test-account-id>-terraform-state"
    acl            = "bucket-owner-full-control"
    encrypt        = "true"
    kms_key_id     = "<kms-key-id>"
    region         = "eu-west-1"
  }
}

provider "aws" {
  version             = "1.52.0"
  region              = "eu-west-1"
  allowed_account_ids = ["<test-account-id>"]
}

data "aws_caller_identity" "current" {}

module "terraform_init" {
  source      = "../../"
  name_prefix = "init-test-default-${data.aws_caller_identity.current.account_id}"

  tags {
    environment = "prod"
    terraform   = "True"
  }
}

output "state_bucket" {
  value = "${module.terraform_init.bucket_id}"
}

output "lock_table" {
  value = "${module.terraform_init.table_id}"
}

output "encryption_key" {
  value = "${module.terraform_init.kms_key_alias_arn}"
}
