terraform {
  backend "s3" {
    bucket = "aishwarya-terraform-bucket"
    key = "ec2-project/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "aishwarya-terraform-dynamo-table"
    encrypt = true
  }
}

