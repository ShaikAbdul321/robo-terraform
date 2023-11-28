##############create ec2 instance terraform################
resource "aws_instance" "web" {
  ami  = data.aws_ami.example.id
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.sg.id]

  tags = {
    Name = var.name
  }
}
####################provisioners in terraform####################
resource "null_resource" "null" {
  depends_on = [aws_instance.web,aws_route53_record.www]
  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      user     = "centos"
      password = "DevOps321"
      host     = aws_instance.web.public_ip
    }
    inline = [
      "sudo set-hostname ${var.name}"
    ]
  }
}
############# creating route53 records in terraform##########
resource "aws_route53_record" "www" {
  zone_id = "Z08631072FSVS0GDIGH1F"
  name    = "${var.name}-dev"
  type    = "A"
  ttl     = 300
  records = [aws_instance.web.private_ip]
}
###########ami id datasource terraform##############
data "aws_ami" "example" {
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  owners           = ["973714476881"]
}
#################security group terraform####################
resource "aws_security_group" "sg" {
  name        = var.name
  description = "Allow TLS inbound traffic"

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.name
  }
}

variable "name" {}
output "public_IP" {
  value = aws_instance.web.public_ip
}