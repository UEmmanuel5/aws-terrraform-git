output "ec2_public_ip" {
  description = "The public IP of the web server"
  value       = aws_instance.web-server-001.public_ip
}
