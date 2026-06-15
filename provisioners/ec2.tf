resource "aws_instance" "expense_cal" {
  count                  = 3
  ami                    = "ami-0220d79f3f480ecf5"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  tags = {
    Name    = "expense-app"
    Purpose = "expense-app-dev"
  }

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = "DevOps321"
    host        = self.public_ip
  }

  provisioner "local-exec" {
    command = "echo ${self.public_ip} > public_ip_${count.index}.txt"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install -y httpd",
      "sudo systemctl start httpd",
      "sudo systemctl enable httpd"
    ]
  }
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tlss-terrdev"
  description = "allow TLS inbound and outbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
