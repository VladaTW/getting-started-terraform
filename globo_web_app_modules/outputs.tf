output "aws_alb_public_dns" {

  description = "Public DNS of the aplication load balancer"
  value       = "http://${aws_lb.nginx.dns_name}"
}
