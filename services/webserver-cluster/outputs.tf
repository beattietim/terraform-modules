output "alb_dns_name" {
  value       = aws_lb.example-alb.dns_name
  description = "Domain name of the load balancer"
}

output "alb_security_group_id" {
  value       = aws_security_group.lb.id
  description = "The ID of the security group attached to the load balancer"
}