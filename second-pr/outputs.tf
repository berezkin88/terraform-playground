output "public_ip" {
  value       = aws_autoscaling_group.example.public_ip
  description = "The public IP address of the web server"
}