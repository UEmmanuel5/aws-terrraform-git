resource "aws_internet_gateway" "main-igw" {
  vpc_id = aws_vpc.main-01.id

  tags = {
    Name = "main-igw"
  }
}