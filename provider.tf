terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_vpc" "example_vpc" {
  cidr_block       = "10.0.2.0/24"
  instance_tenancy = "default"

  tags = {
    Name = "ExampleVPC"
  }
}

output "vpc_id" {
  value = aws_vpc.example_vpc.id
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.example_vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-west-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public Subnet"
  }
}


resource "aws_instance" "app_server" {
  ami           = "ami-04e914639d0cca79a"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet.id

  tags = {
    Name = "ExampleAppServerInstance"
  }
}

resource "aws_eip" "example_eip" {
  instance = aws_instance.app_server.id
  vpc      = true

  tags = {
    Name = "ExampleEIP"
  }
}

resource "aws_internet_gateway" "example_igw" {
  vpc_id = aws_vpc.example_vpc.id

  tags = {
    Name = "ExampleInternetGateway"
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.example_vpc.id

  tags = {
    Name = "PublicRouteTable"
  }
}

resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.example_igw.id
}

resource "aws_security_group" "example_sg" {
  name        = "ExampleSecurityGroup"
  description = "Security group for EC2 instance"

  vpc_id = aws_vpc.example_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "web_server" {
  ami           = "ami-04e914639d0cca79a" # Replace with the appropriate AMI ID for your desired operating system and region
  instance_type = "t2.micro"              # Free tier instance type

  key_name  = "soniyakeypair" # Replace with your key pair name
  subnet_id = aws_subnet.public_subnet.id
  #security_group_id           = aws_security_group.example_sg.id
  associate_public_ip_address = true
  user_data = <<-EOF
    #!/bin/bash
    # Install web server 
     sudo apt-get update
    sudo apt-get install -y nginx

 # Clone the GitHub repository
    git clone <https://github.com/Soniyasneha/demohtml> /tmp/repo

    # Copy the HTML file to the web server root directory
    sudo cp /tmp/repo/demo.html /var/www/html/index.html
    # Restart Nginx
    sudo systemctl restart nginx
  EOF

  tags = {
    Name = "WebServerInstance"
  }
}
data "template_file" "html_file" {
  template = file("${path.module}/demo.html")
}



# User data script to configure the instance
  user_data = data.template_file.html_file.rendered

  tags = {
    Name = "WebServerInstance"
  }






