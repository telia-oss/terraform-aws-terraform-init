terraform {
  required_version = ">= 0.12"
}

provider "aws" {
  version = ">= 2.17"
  region  = "${var.region}"
}

data "aws_caller_identity" "current" {}

module "terraform_init" {
  source      = "../../"
  name_prefix = var.name_prefix

  tags = {
    environment = "dev"
    terraform   = "True"
  }
}
