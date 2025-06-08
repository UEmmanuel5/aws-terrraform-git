resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main-01.id

  tags = {
    Name = "igw"
  }
}