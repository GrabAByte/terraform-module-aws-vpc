output "security_groups" {
  value = aws_security_group.security_group[0].id
}

output "vpc_subnet_0" {
  value = aws_subnet.private_subnet_0.id
}

output "vpc_subnet_1" {
  value = aws_subnet.private_subnet_1.id
}
