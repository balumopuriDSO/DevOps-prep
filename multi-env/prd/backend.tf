backend "s3" {
bucket = "bala-terraform-prd"
key = "expense-backend-infra-prd"
region = "us-east-1"
dynamodb_table = "bala-terraform-prd"