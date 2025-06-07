resource "aws_vpc" "main" {
  cidr_block       = "192.168.10.128/26"
  instance_tenancy = "default"

  tags = {
    Name = "main"
  }
}