terraform {
  backend "s3" {
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}

resource "aws_s3_bucket" "bucket" {
  bucket = variables.bucket_names
  acl    = "private"

  tags = {
    Name = variables.bucket_names
  }
}

module "bucket" {
  source = "./module/bucket"
  count  = length(variables.bucket_names)

  bucket_name = variables.bucket_names[count.index]
}
