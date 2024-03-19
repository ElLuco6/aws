# resource "aws_security_group" "nginx_sg" {
#   name        = "nginx-sg"
#   description = "Security group for nginx instance"
#   vpc_id      = aws_vpc.my_vpc.id

#   ingress {
#     from_port   = 80
#     to_port     = 80
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

# # Création de l'instance EC2 Ubuntu avec Nginx
# resource "aws_instance" "nginx_instance" {
#   ami                    = "your_ami_id"
#   instance_type          = "your_instance_type"
#   subnet_id              = aws_subnet.private_subnets[0].id
#   key_name               = aws_key_pair.my_key.key_name
#   security_group_ids     = [aws_security_group.nginx_sg.id]

#   user_data = <<-EOF
#               #!/bin/bash
#               apt-get update
#               apt-get install -y nginx
#               systemctl start nginx
#               EOF

#   tags = {
#     Name = "Nginx Server"
#   }
# }