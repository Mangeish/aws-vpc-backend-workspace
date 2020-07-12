
# Backend configuration is loaded early so we can't use variables
terraform {
  backend "s3" {
    region = "eu-north-1"
    bucket = "mybuckett117"
    key = "terraform.tfstate"
    encrypt = true    #AES-256 encryption
  }
}