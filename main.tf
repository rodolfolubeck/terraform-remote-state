terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.54.1"
    }
  }

  backend "s3" {
    # bucket  = "tfstate-051205392543"
    # key     = "dev/terraform.tfstate"
    # region  = "sa-east-1"
    # profile = "dev_full"
  }

}


provider "aws" {
  region  = "sa-east-1"
  profile = "dev_full"
}