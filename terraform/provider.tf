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

module "bucket" {
  source = "./module/bucket"
  count  = length(var.bucket_names)

  bucket_name = var.bucket_names[count.index]
}
