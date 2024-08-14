output "default_sg" {
    value = aws_default_security_group.default.id
}

output "ssm_sg" {
    value = aws_security_group.ssm_sg.id
}