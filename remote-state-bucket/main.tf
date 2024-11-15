terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.54.1"
    }
  }
}


provider "aws" {
  region  = "sa-east-1"
  profile = "dev_full"
}


data "aws_caller_identity" "current" {}


resource "aws_s3_bucket" "remote-state" {
  bucket = "tfstate-${data.aws_caller_identity.current.account_id}"

  tags = {
    Description = "AWS S3 stores terraform remote state files"
    ManagedBy   = "Terraform"
    Owner       = "Rodolfo Lubeck"
    CreatedAt   = "15/11/2024"
  }
}


resource "aws_s3_bucket_versioning" "remote-state" {
  bucket = aws_s3_bucket.remote-state.id

  versioning_configuration {
    status = "Enabled"
  }
}


output "remote_state_bucket" {
  value = aws_s3_bucket.remote-state.bucket
}


output "remote_state_bucket_arn" {
  value = aws_s3_bucket.remote-state.arn
}