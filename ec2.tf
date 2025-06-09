resource "aws_instance" "web" {
  ami                         = "ami-069cb3204f7a90763"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.main_subnet-1.id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  key_name                    = "my-key"  # Add this

#   user_data = <<-EOF
#               #!/bin/bash
#               sudo apt update -y
#               sudo apt upgrade -y
#               sudo apt install nginx -y
#               sudo systemctl start nginx
#               EOF
# user_data = <<-EOF
#             #!/bin/bash
#             sudo apt update -y
#             sudo apt install nginx unzip wget -y
#             cd /var/www/html
#             sudo rm -rf *
#             wget https://github.com/UEmmanuel5/aws-terrraform-git/archive/refs/heads/main.zip
#             unzip main.zip
#             cp -r aws-terrraform-git-main/website/* /var/www/html/
#             sudo systemctl restart nginx
#             EOF
  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install nginx -y
              sudo systemctl start nginx
              cd /var/www/html
              sudo rm -rf *
              echo "<h1>Page cleared and replaced</h1>" > index.html
              sudo systemctl restart nginx
              EOF


  tags = {
    Name = "web-server"
  }
}
