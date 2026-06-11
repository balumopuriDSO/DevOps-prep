terraform {
  required_version = ">= 1.0"
  required_providers {
    # Add your required providers here
    # Example:
    # aws = {
    #   source  = "hashicorp/aws"
    #   version = "~> 5.0"
    # }
  }
}

# Configure the provider
# provider "aws" {
#   region = var.aws_region
# }

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
