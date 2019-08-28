# ------------------------------------------------------------------------------
# Output
# ------------------------------------------------------------------------------
output "bucket_id" {
  description = "The name of the bucket."
  value       = aws_s3_bucket.state.id
}

output "table_id" {
  description = "The name of the table."
  value       = aws_dynamodb_table.lock.id
}

output "kms_key_arn" {
  description = "The Amazon Resource Name (ARN) of the key."
  value       = aws_kms_key.encrypt.arn
}

output "kms_key_id" {
  description = "The globally unique identifier for the key."
  value       = aws_kms_key.encrypt.key_id
}

output "kms_key_alias_arn" {
  description = "The Amazon Resource Name (ARN) of the key alias."
  value       = aws_kms_alias.encrypt-alias.arn
}

