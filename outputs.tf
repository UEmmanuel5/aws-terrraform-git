output "ec2_public_ip" {
  description = "The public IP of the web server"
  value       = aws_instance.web-server-002.public_ip
}
