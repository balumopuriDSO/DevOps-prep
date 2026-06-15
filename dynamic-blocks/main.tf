terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "expense_app" {
    count   = 3
    ami          = var.ami_id
    instance_type = var.instance_type
    # tags = {
    #     Name  = "${var.instances[count.index]}-${var.environment}"
    #     Purpose =   "${var.instances[count.index]}-${var.environment}"
    # }

    tags = merge(
        var.ec2_tags, {
        Name  = "${var.instances[count.index]}-${var.environment}"
        Purpose =   "${var.instances[count.index]}-${var.environment}"
    }, var.common_tags)
}

resource "aws_security_group" "allow_tls" {
    name = "allow_tls-${var.environment}"
    description = "allow TLS inbound and outbound traffic"
    # ingress {
    #     from_port   =   var.from_port
    #     to_port = var.to_port
    #     protocol = "tcp"
    #     cidr_blocks = var.cidr_blocks

    dynamic "ingress" {
        for_each = var.ingress_ports
        content {
            from_port   = ingress.value.from_port
            to_port     = ingress.value.to_port
            protocol    = ingress.value.protocol
            cidr_blocks = ingress.value.cidr_blocks
        }
    }

    egress {
        from_port   =  80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = var.cidr_blocks
    }
    
}

# output "ec2_info" {
#     value = aws_instance.expense_app
# }
