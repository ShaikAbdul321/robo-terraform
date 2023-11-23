data "aws_ec2_spot_price" "example" {
  instance_type     = "t3.medium"
  availability_zone = "us-east-1a"

  filter {
    name   = "product-description"
    values = ["Linux/UNIX"]
  }
}
output "t3_medium_spot_price" {
  value = data.aws_ec2_spot_price.example.spot_price
}


data "aws_security_group" "selected" {
  id = "sg-0fdd769c0bba41ee3"
}
output "security_group_name" {
  value = data.aws_ec2_spot_price.example.name
}

data "aws_security_group" "selected" {
  name= "allow-all"
}
output "allow_all_id" {
  value = data.aws_ec2_spot_price.example.id
}