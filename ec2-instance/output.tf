output "instance-dns" {
  value = aws_instance.app_server.public_dns
}