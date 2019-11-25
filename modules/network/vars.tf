variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "vpc_tenancy" {
  default = "dedicated"
}

variable "vpc_id" {}
variable "subnet_cidr" {
  default = "10.0.0.0/24"
}
