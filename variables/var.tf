variable "plain" {
   default= "hello world"
}
output "demo2" {
  value = var.plain
}

variable "list" {
  default = ["AWS","DEVOPS","CLOUD"]
}
output "list_output" {
  value = var.list[0]
}

variable "map" {
  default = {
    devops = {
      Time="10AM"
      Duration="90Days"
    }
    AWS = {
      Time="12AM"
      Duration="45Days"
    }
  }
}
output "map_output"{
  value = var.map["devops"]
}

variable "env" {}
output "tfvars_output" {
  value = var.env
}
variable "fruit" {}
output "fruit" {
  value = var.fruit
}