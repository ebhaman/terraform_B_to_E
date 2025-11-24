terraform {
  required_version = ">=1.7.8"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.5"
    }

  }
 backend "s3" {
    bucket = "terraform-course-manoj-remote-backend"
    key    = "04-backends/dev/state.tfstate"
    region = "eu-north-1"

}
}
provider "aws" {
  region = "eu-north-1"

}
