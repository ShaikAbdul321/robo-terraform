variable "plain" {
   default= "hello world"

}

output "demo2" {
  value = var.plain
}