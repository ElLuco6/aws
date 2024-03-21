# Création de l'instance EC2 Ubuntu avec Nginx
resource "aws_instance" "mern_instance" {
  ami                    = "ami-00c71bd4d220aa22a"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.private_subnets[0].id
  key_name               = aws_key_pair.my_key.key_name
  vpc_security_group_ids = [aws_security_group.mern_sg.id]

  tags = {
    Name = "Mern Server"
  }
}