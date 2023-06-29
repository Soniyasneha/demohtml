terraform {
  backend "s3" {
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}

resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_names
  acl    = "private"

  tags = {
    Name = var.bucket_names
  }
}

module "bucket" {
  source = "./terraform"
  count  = length(var.bucket_names)

  bucket_name = var.bucket_names[count.index]
}
