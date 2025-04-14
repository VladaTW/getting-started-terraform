output "aws_instance_public_dns" {
  description = "Public DNS of the Nginx instance"
  value = "http://${aws_instance.nginx1.public_ip}"
}
