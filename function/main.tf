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
###########Number of items in list##########
variable "list" {
  default = ["apple","banana"]
}
output "s4" {
  value = length(var.list)
}
###########it loops and answer is banana##########
output "s5" {
  value = element(var.list,3)
}
###########map type list##########
variable "course" {
  default = {
    Devops ={
      topic = ["Devops","Jenkins"]
      Duration = "90Days"
    }
    AWS = {
      topic = "cloud"
    }
  }
}
output "course_detail" {
  value = var.course["Devops"]["topics"]
}
####### To lookup whether value is there or not ######
output "course_lookup" {
  value = lookup(lookup(var.course,"AWS",null),"Duration","Duration not found")
}
####### Merging of two functions ######
variable "name" {
  default = {
    fruit_name = "apple"
  }
}

variable "details" {
  default = {
    quantity = 100
    rating   = 4.0
  }
}
output "merge" {
  value = merge(var.name,var.details)
}