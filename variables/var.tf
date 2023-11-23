variable "plain" {
   default= "hello world"
}
output "demo2" {
  value = var.plain
}
variable "list" {
  default = ["AWS","DEVOPS","CLOUD"]
}
output "demo3" {
  value = var.list[0]
}
