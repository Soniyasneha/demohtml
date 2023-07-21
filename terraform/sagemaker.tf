resource "aws_sagemaker_endpoint_configuration" "example" {
  name = "example-endpoint-config"

  production_variants {
    variant_name  = "AllTraffic"
    initial_instance_count = 1
    instance_type = "ml.m4.xlarge"  # Replace this with your desired instance type
    initial_variant_weight = 1
  }
}
resource "aws_sagemaker_endpoint" "example" {
  name   = "example-endpoint"
  endpoint_config_name = aws_sagemaker_endpoint_configuration.example.name
}
