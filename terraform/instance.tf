resource "aws_instance" "app_server" {
  ami                         = "ami-06b09bfacae1453cb"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public_subnet.id
  key_name                    = "key pairr"
  associate_public_ip_address = true


  tags = {
    Name = "var.instance_name"
  }
}

resource "aws_eip" "example_eip" {
  instance = aws_instance.app_server.id
  vpc      = true

  tags = {
    Name = "ExampleEIP"
  }
}
