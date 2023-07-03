variable "instance_name" {
  description = "Name of the EC2 instance"
  type        = string
  default     = "ExampleAppServerInstance"
}

variable "ami_id" {
  type    = string
  default = "ami-06b09bfacae1453cb"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}


variable "key_name" {
  type    = string
  default = "key pairr"
}

variable "associate_public_ip" {
  type    = bool
  default = true
}

variable "vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/24"
}

variable "subnet_cidr_block" {
  type    = string
  default = "10.0.0.0/24"
}

variable "availability_zone" {
  type    = string
  default = "us-east-1a"
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "ExampleVPC"
}

variable "security_group_name" {
  description = "Name of the security group"
  type        = string
  default     = "ExampleSecurityGroup"
}

variable "bucket1_name" {
  description = "Name of the S3 bucket"
  type        = string
  default     = "learnterraform1234"
}

variable "bucket2_name" {
  description = "Name of the S3 bucket"
  type        = string
  default     = "learnterraform1111"
}


