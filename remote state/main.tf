terraform {
  backend "s3" {
    bucket = "shaiksbucket-terraform"
    key    = "shaik/sample"
    region = "us-east-1"
  }
}
output "sample" {
  value = "Apple is a fruit"
}
