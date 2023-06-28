terraform {
  backend "s3" {
    bucket         = "<your-bucket-name>"
    key            = "terraform.tfstate"
    region         = "<your-aws-region>"
    dynamodb_table = "<optional-dynamodb-table-name>"
    encrypt        = true
  }
}
