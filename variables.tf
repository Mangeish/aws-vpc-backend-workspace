/* variable “workspace_to_environment_map” {
  type = “map”
  default = {
    dev     = “dev”
    qa      = “qa”
    prod    = “prod”
  }
} */
variable "region" {
default = "eu-north-1" 
}
variable "vpc_name" {
default = "my-vpc" 
}
variable "prefix" {
default = "dev"
}