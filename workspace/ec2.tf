resource "aws_instance" "expense_app_workspace" {
    ami              = var.ami_id
    instance_type    = var.instance_type
    security_groups  = [aws_security_group.allow_tls.name]
    
    tags = {
        name    = "terraform-demo-${terraform.workspace}"
        purpose = "terraform-practice"
    }
}

resource "aws_security_group" "allow_tls" {
    name        = "allow_tls-${terraform.workspace}"
    description = "allow TLS inbound and outbound traffic"

    ingress {
        from_port   = var.from_port
        to_port     = tonumber(var.to_port)
        protocol    = "tcp"
        cidr_blocks = var.cidr_blocks
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}