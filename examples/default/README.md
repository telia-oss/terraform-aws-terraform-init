## examples/default

The example will output the three pieces of information needed to set up a [remote backend](https://www.terraform.io/docs/backends/types/s3.html) for Terraform (on AWS):

```hcl
terraform {
  backend "s3" {
    key            = "path/keyname.tfstate"
    acl            = "bucket-owner-full-control"
    encrypt        = "true"
    bucket         = "<state_bucket>"
    dynamodb_table = "<lock_table>"
    kms_key_id     = "<encryption_key>"
    region         = "eu-west-1"
  }
}
```

Where `<state_bucket>`, `<lock_table>` and `<encryption_key>` are the outputs from the example. Because S3 buckets
need globally unique names, we recommend prefixing the bucket name with the account ID.
