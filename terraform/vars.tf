# variables 

variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}


variable "AWS_REGION" {
    default = "eu-west-2"
}

variable "AMIS" {
    type = "map"
    default = {
        eu-west-1 = ""
        eu-west-2 = "ami-5daa463a"
        eu-west-3 = ""
    }
}

variable "PATH_TO_PUBLIC_KEY" {
 default = "../credentials/mykey.pub"
}
variable "PATH_TO_PRIVATE_KEY" {
 default = "../credentials/mykey"
}

