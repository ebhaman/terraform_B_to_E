terraform {
  required_version = ">= 1.10.0, <=1.13.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
