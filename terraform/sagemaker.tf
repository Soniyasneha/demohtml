resource "aws_sagemaker_notebook_instance" "notebook" {
  name          = "my-notebook-instance"
  role_arn      = "sagemaker"
  instance_type = "ml.t2.medium"

  tags = {
    Name = "sagemaker"
  }
}
