variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.2.0/24"
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
  default     ="aws_vpc.example_vpc.id"
}

variable "subnet_cidr_block" {
  description = "CIDR block for the subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "subnet_availability_zone" {
  description = "Availability zone for the subnet"
  type        = string
  default     = "us-east-1a"
}


variable "route_table_id" {
  description = "ID of the route table"
  type        = string
  default     ="aws_route_table.public_route_table.id"
}

variable "destination_cidr_block" {
  description = "Destination CIDR block for the route"
  type        = string
  default     = "0.0.0.0/0"
}

variable "gateway_id" {
  description = "ID of the internet gateway"
  type        = string
}

variable "security_group_name" {
  description = "Name of the security group"
  type        = string
  default     = "ExampleSecurityGroup"
}

variable "security_group_description" {
  description = "Description of the security group"
  type        = string
  default     = "Security group for EC2 instance"
}

variable "security_group_vpc_id" {
  description = "ID of the VPC for the security group"
  type        = string
}

variable "security_group_ingress_from_port" {
  description = "Starting port for ingress traffic"
  type        = number
  default     = 80
}

variable "security_group_ingress_to_port" {
  description = "Ending port for ingress traffic"
  type        = number
  default     = 80
}

variable "security_group_ingress_protocol" {
  description = "Protocol for ingress traffic"
  type        = string
  default     = "tcp"
}

variable "security_group_ingress_cidr_blocks" {
  description = "CIDR blocks for ingress traffic"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "security_group_egress_from_port" {
  description = "Starting port for egress traffic"
  type        = number
  default     = 0
}

variable "security_group_egress_to_port" {
  description = "Ending port for egress traffic"
  type        = number
  default     = 0
}

variable "security_group_egress_protocol" {
  description = "Protocol for egress traffic"
  type        = string
  default     = "-1"
}

variable "security_group_egress_cidr_blocks" {
  description = "CIDR blocks for egress traffic"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-053b0d53c279acc90"
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "subnet_id" {
  description = "ID of the subnet for the EC2 instance"
  type        = string
}

variable "key_name" {
  description = "Key pair name for SSH access to the EC2 instance"
  type        = string
  default     = "keypair"
}

variable "associate_public_ip" {
  description = "Flag to associate a public IP address to the EC2 instance"
  type        = bool
  default     = true
}

variable "eip_name" {
  description = "Name for the Elastic IP (EIP) resource"
  type        = string
  default     = "ExampleEIP"
}

