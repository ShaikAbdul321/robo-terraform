###########To print in capital letters#######
variable "sa" {
  default = "apple"
}
output "s1" {
  value = upper(var.sa)
}
##########ceil value########
output "s2" {
  value = ceil(5.1)
}
###########minimum value###########
output "s3" {
  value = min(12,68,9)
}
###########length value##########
variable "len" {
  default = ["apple","banana"]
}
output "s4" {
  value = length(var.len)
}