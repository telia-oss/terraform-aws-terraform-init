# ------------------------------------------------------------------------------
# Resources
# ------------------------------------------------------------------------------
resource "aws_s3_bucket" "state" {
  bucket = "${var.name_prefix}-terraform-state"
  acl    = "private"

  versioning {
    enabled = true
  }

  tags = merge(
    var.tags,
    {
      "Name" = "${var.name_prefix}-terraform-state"
    },
  )
}

resource "aws_dynamodb_table" "lock" {
  name           = "${var.name_prefix}-terraform-state"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = merge(
    var.tags,
    {
      "Name" = "${var.name_prefix}-terraform-state"
    },
  )
}

resource "aws_kms_key" "encrypt" {
  description             = "Terraform state KMS key."
  deletion_window_in_days = 30
  tags = merge(
    var.tags,
    {
      "Name" = "${var.name_prefix}-terraform-state-kms-key"
    },
  )
}

resource "aws_kms_alias" "encrypt-alias" {
  name          = "alias/${var.name_prefix}-terraform-state-encryption-key"
  target_key_id = aws_kms_key.encrypt.key_id
}

