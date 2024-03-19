# # Création de la clé SSH pour l'accès aux instances
# resource "aws_key_pair" "my_key" {
#   key_name   = "my-key"
#   public_key = file("~/.ssh/id_rsa.pub")
# }

# # Création des règles de sécurité pour les instances EC2
# resource "aws_security_group" "bastion_sg" {
#   name        = "bastion-sg"
#   description = "Security group for bastion instance"
#   vpc_id      = aws_vpc.my_vpc.id

#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }

# # Création de l'instance EC2 Ubuntu pour le bastion
# resource "aws_instance" "bastion_instance" {
#   ami                         = "your_ami_id"
#   instance_type               = "your_instance_type"
#   subnet_id                   = aws_subnet.public_subnets[0].id
#   associate_public_ip_address = true
#   key_name                    = aws_key_pair.my_key.key_name

#   tags = {
#     Name = "Bastion"
#   }
# }
