output "address" {
  value       = aws_db_instance.example.address
  description = "Connect to database endpoint"
}

output "port" {
  value       = aws_db_instance.example.port
  description = "Connect to database endpoint"
}
