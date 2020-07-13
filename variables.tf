variable "region" {
default = "eu-north-1" 
}
variable "vpc_name" {
default = "my-vpc" 
}
variable "prefix" {
default = "dev"
}

locals {  
  transit_config = {    
  cidr                = "10.128.0.0/16"    
  peer_region         = "us-west-2"    
  peer_route_table_id = "rtb-b5e31fd3"  
  }
  
  #public_subnet_count  = length(data.aws_availability_zones.available.names)   
 
  #private_subnet_count = length(data.aws_availability_zones.available.names)   
  config_map = {     

  "dev" = {
	"region" = "eu-north-1"      
		"network" = {
		"vpc_name" = "dev-vpc"	
		"cidr" = "10.0.0.0/16"
        "private_subnets" = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
		}
	}
  
  "prod" = {      
	"region" = "eu-north-1"      
		"network" = {        
		"vpc_name" = "prod-vpc"
		"cidr" = "172.100.0.0/16"   
		"private_subnets" = ["172.100.0.0/24", "172.100.1.0/24", "172.100.2.0/24"]	
    }
  }
 }
 }
 locals {  
	cfg = local.config_map[terraform.workspace]
	}
