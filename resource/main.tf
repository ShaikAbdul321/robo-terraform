##############create ec2 instance terraform################
resource "aws_instance" "web" {
  ami  = data.aws_ami.example.id
  instance_type = "t2.micro"
  security_groups = [aws_security_group.sg.name]

  tags = {
    Name = "HelloWorld"
  }
}
###########ami id datasource terraform##############
data "aws_ami" "example" {
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  owners           = ["973714476881"]
 }
#################security group terraform####################
resource "aws_security_group" "sg" {
  name        = "sallow-all"
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
    Name = "sallow-all"
  }
}
