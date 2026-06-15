backend "s3" {
bucket = "bala-terraform-dev"
key = "expense-backend-infra-dev"
region = "us-east-1"
dynamodb_table = "bala-terraform-dev"