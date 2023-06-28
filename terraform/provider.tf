terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}

module "s3_bucket" {
  source      = "./modules/s3_bucket"
  bucket_name = var.bucket_names[0]
}

