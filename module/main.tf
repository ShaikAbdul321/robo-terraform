module "s1" {
  source = "./ec2"
  name = "frontend"
}
module "s2" {
  source = "./ec2"
  name = "mongodb"
}
module "s3" {
  source = "./ec2"
  name = "catalogue"
}

output "s1_public_Ip" {
  value = module.s1.public_IP
}

