resource "aws_sagemaker_notebook_instance" "notebook" {
  name          = "my-notebook-instance"
  role_arn      = "arn:aws:iam::933400543978:role/service-role/AmazonSageMaker-ExecutionRole-20230720T082550"  
  instance_type = "ml.t2.medium"

  tags = {
    Name = "sagemaker"
  }
}
