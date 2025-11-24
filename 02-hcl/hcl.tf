terraform {
    requirequired_version = "1.7.8"
    bacbackend "s3" {
      
    }   
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
  }
}

resource "aws_s3_bucket" "name" {
    bucket=var.my_variable
    }

data "aws_s3_bucket" "my_first_bucket" {    
    bucket ="aws_s3_bucket.name.aws_s3_bucket"  
}

variable "my_variable" { 
    default = "Hello, Terraform!" 
    type    = string
    description = "A sample variable"
  
}
output "buckt_id" {
    value = aws_s3_bucket.my_first_bucket.id
}

locals {
    local_example = "This is a local value"
}

module "my_module" {    
    source = "./modules/sample_module"
  
}