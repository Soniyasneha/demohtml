resource "aws_instance" "app_and_web_server" {
  ami                         = "ami-053b0d53c279acc90"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public_subnet.id
  key_name                    = "keypair"
  associate_public_ip_address = true
}

resource "aws_eip" "example_eip" {
  instance = aws_instance.app_and_web_server.id
  vpc      = true

  tags = {
    Name = "ExampleEIP"
  }
}