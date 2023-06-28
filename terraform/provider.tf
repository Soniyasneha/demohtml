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
  region = "us-east-1"
}

resource "aws_instance" "app_and_web_server" {
  ami                         = "ami-053b0d53c279acc90"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public_subnet.id
  key_name                    = "keypair"
  associate_public_ip_address = true

  # User data script to configure the instance
  user_data = <<-EOF
    #!/bin/bash
    # Install web server 
     sudo apt-get update
    sudo apt-get install -y nginx

 # Clone the GitHub repository
    git clone <https://github.com/Soniyasneha/indexhtml> /tmp/repo

    # Copy the HTML file to the web server root directory
    sudo cp /tmp/repo/index.html /var/www/html/index.html
    # Restart Nginx
    sudo systemctl restart nginx
  EOF


  tags = {
    Name = "AppAndWebServerInstance"
  }
}

resource "aws_eip" "example_eip" {
  instance = aws_instance.app_and_web_server.id
  vpc      = true

  tags = {
    Name = "ExampleEIP"
  }
}









