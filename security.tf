# Main security group definition
resource "aws_security_group" "web_sg" {
  name        = "web-sg"
  description = "Allow HTTP and SSH inbound traffic"
  vpc_id      = aws_vpc.main-01.id

  tags = {
    Name = "web-sg"
  }
}

# Allow HTTP (port 80) from anywhere
resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.web_sg.id
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
  description       = "Allow HTTP from anywhere"
}

# Allow SSH (port 22) — choose one option:
# Option 1: Safe for production – only YOUR IP
# Replace the CIDR below with your actual IP/32 (e.g. 105.200.33.10/32)

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.web_sg.id
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0" #  Change to your IP in production
  description       = "Allow SSH from anywhere"
}

# Allow all outbound traffic (recommended for public EC2)
resource "aws_vpc_security_group_egress_rule" "allow_all_egress" {
  security_group_id = aws_security_group.web_sg.id
  ip_protocol       = "-1"  # -1 means all protocols
  cidr_ipv4         = "0.0.0.0/0"
  description       = "Allow all outbound traffic"
}
