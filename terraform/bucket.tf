terraform {
  backend "s3" {
    bucket         = "<your-bucket-name>"
    key            = "terraform.tfstate"
    region         = "<your-aws-region>"
    encrypt        = true
    acl            = "private"
  }
}
