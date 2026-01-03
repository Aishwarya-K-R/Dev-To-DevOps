variable "region" {
  description = "AWS region"
}

variable "bucket_name" {
  description = "S3 bucket for Terraform state"
}

variable "dynamodb_table_name" {
  description = "DynamoDB table for state locking"
}

