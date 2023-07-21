resource "aws_sagemaker_notebook_instance" "notebook" {
  name          = "my-notebook-instance"
  role_arn      = "arn:aws:iam::933400543978:role/sagemaker"
  instance_type = "t2.micro"

  tags = {
    Name = "sagemaker"
  }
}
