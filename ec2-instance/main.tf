resource "aws_security_group" "allow_tls" {
    name        = "allow_tls-${var.environment}"
    description = "Allow inbound SSH/HTTP and all outbound"

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

    tags = merge(var.sg_tags, var.common_tags)
}

resource "aws_instance" "expense_app" {
    count                     = length(var.instances)
    ami                       = data.aws_ami.joindevops.id
    instance_type             = var.instance_type
    associate_public_ip_address = true
    vpc_security_group_ids    = [aws_security_group.allow_tls.id]

    tags = merge(
        var.ec2_tags,
        {
            Name    = "${var.instances[count.index]}-${var.environment}"
            Purpose = "${var.instances[count.index]}-${var.environment}"
        },
        var.common_tags,
    )
}

output "ec2_private_ips" {
    value = [for i in aws_instance.expense_app : i.private_ip]
}

output "ec2_public_ips" {
    value = [for i in aws_instance.expense_app : i.public_ip]
}
