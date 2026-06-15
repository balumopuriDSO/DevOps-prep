terraform {
  required_version = ">= 1.0"
  required_providers {
    # Add your required providers here
    # Example:
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  # backend "s3"{
  #     backend "s3" {
  #   bucket = "terraform"
  #   key = "expense-backend-infra"
  #   region = "us-east-1"
  #   dynamodb_table = "bala-state-locking"
  # }
  # }
}

# Configure the provider
provider "aws" {
  region = "us-east-1"
}

# Add your resources here
# Example resource:
# resource "aws_instance" "example" {
#   ami           = data.aws_ami.ubuntu.id
#   instance_type = "t2.micro"
#
#   tags = {
#     Name = "example-instance"
#   }
# }
