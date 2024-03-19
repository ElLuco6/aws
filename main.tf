terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    profile = "maceobasse"
    bucket  = "m1wd-tf-states"
    key = "network.tfstate"
    region = "eu-west-3" 
    role_arn = "arn:aws:iam::637423553682:role/TerraformBackend"
  }
}
provider "aws" {
  region = "eu-west-3"
  profile = "maceobasse"
   assume_role {
    role_arn = "arn:aws:iam::637423553682:role/ComputeManagerRole"
  }
} 