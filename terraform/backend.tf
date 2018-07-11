

terraform {
  backend "s3" {
    bucket = "mmsajid-tf-state"
    key    = "mykey"
    region = "eu-west-2"
  }
} 
