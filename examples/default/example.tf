provider "aws" {
  region = "eu-west-1"
}

data "aws_caller_identity" "current" {}

module "terraform_init" {
  source      = "../../"
  name_prefix = "${data.aws_caller_identity.current.account_id}"

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
