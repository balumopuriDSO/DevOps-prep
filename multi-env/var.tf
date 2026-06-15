variable "ami_id" {
  default = "ami-0220d79f3f480ecf5"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "ec2_tags" {
  default = {
    Name    = "expense-app"
    Purpose = "expense-app-dev"
  }
}

variable "from_port" {
  default = 22
}

variable "to_port" {
  default = "22"
}

variable "cidr_blocks" {
  default = ["0.0.0.0/0"]
}

variable "aws_region" {
  default = "us-east-1"

}

variable "sg_tags" {
  default = {
    Name    = "allow_tlss"
    Purpose = "allow_tls_dev"
  }
}

variable "instances" {
  default = ["mysql", "backend", "frontend"]
}

variable "environment" {
  # default = "dev"
}

variable "route53_zone_id" {
  default = "Z1003784M55T6CSMP30H"
}

variable "domain_name" {
  default = "balaportfolio.space"
}

variable "common_tags" {
  default = {
    environment = "dev"
    Project     = "expense-app"
  }
}