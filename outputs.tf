output "ec2_public_ip" {
  description = "The public IP of the web server"
  value       = aws_instance.web-server-004.public_ip
}
