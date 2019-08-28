output "state_bucket" {
  value = module.terraform_init.bucket_id
}

output "lock_table" {
  value = module.terraform_init.table_id
}

output "encryption_key" {
  value = module.terraform_init.kms_key_alias_arn
}
