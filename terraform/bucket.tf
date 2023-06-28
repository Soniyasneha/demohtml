terraform {
  backend "s3" {
    bucket         = "terraform123"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    acl            = "private"
  }
}
