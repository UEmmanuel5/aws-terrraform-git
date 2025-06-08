resource "aws_vpc" "main-01" {
  cidr_block       = "192.168.10.128/26"
  instance_tenancy = "default"

  tags = {
    Name = "main-01"
  }
}