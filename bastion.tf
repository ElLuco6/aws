# Création de la clé SSH pour l'accès aux instances
resource "aws_key_pair" "my_key" {
  key_name   = "bastion-key"
  public_key = file("~/.ssh/id_rsa.pub")
}



# Création de l'instance EC2 Ubuntu pour le bastion
resource "aws_instance" "bastion_instance" {
  ami                         = "ami-00c71bd4d220aa22a"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public_subnets[0].id
  associate_public_ip_address = true
  key_name                    = aws_key_pair.my_key.key_name
  security_groups = [ aws_security_group.bastion_sg.id ]

  tags = {
    Name = "Bastion"
  }
}
output "bastion_public_ip" {
  value = aws_instance.bastion_instance.public_ip
  description = "The public IP of the bastion instance"
}