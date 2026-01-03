output "instance_id" {
  description = "EC2 Instance ID"
  value = aws_instance.app_server.id
}

output "public_ip" {
  description = "Public IP address"
  value = aws_instance.app_server.public_ip
}

output "private_ip" {
  description = "Private IP address"
  value = aws_instance.app_server.private_ip
}

output "availability_zone" {
  description = "Availability zone"
  value = aws_instance.app_server.availability_zone
}

output "ssh_command" {
  description = "SSH command to access the EC2 instance"
  value = "ssh ubuntu@${aws_instance.app_server.public_ip}"
}
