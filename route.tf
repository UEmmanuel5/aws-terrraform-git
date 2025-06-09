# Route Table for public access to Internet
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main-01.id

  route {
    cidr_block = "0.0.0.0/0"                    # "Everything on the internet"
    gateway_id = aws_internet_gateway.main-igw.id  # Send it to the Internet Gateway
  }

  tags = {
    Name = "public-rt"
  }
}

# Associate Route Table with Subnet 1 (ap-southeast-1a)
resource "aws_route_table_association" "public_1_assoc" {
  subnet_id      = aws_subnet.main_subnet-1.id
  route_table_id = aws_route_table.public_rt.id
}

# Associate Route Table with Subnet 2 (ap-southeast-1b)
resource "aws_route_table_association" "public_2_assoc" {
  subnet_id      = aws_subnet.main_subnet-2.id
  route_table_id = aws_route_table.public_rt.id
}
