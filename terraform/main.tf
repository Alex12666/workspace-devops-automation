resource "aws_instance" "maquina" {
  ami           = var.my_system
  instance_type = var.my_machine
  key_name      = "Devops-Automation"


  subnet_id = data.aws_subnet.existsubnet.id

  vpc_security_group_ids = [aws_security_group.allow_sg.id]

  associate_public_ip_address = true

  tags = {
    Name = "maquina-frontend"
  }
}

output "ip_publico" {
  value = aws_instance.maquina.public_ip
}