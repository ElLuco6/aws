# Création du Load Balancer Application
# Création du groupe de sécurité pour le Load Balancer Application
# resource "aws_security_group" "alb_sg" {
#   name        = "alb-sg"
#   description = "Security group for Application Load Balancer"
#   vpc_id      = aws_vpc.my_vpc.id

#   ingress {
#     from_port       = 80
#     to_port         = 80
#     protocol        = "tcp"
#     security_groups = [aws_security_group.mern_sg.id]
#   }

#   ingress {
#     from_port       = 443
#     to_port         = 443
#     protocol        = "tcp"
#     security_groups = [aws_security_group.mern_sg.id]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }

resource "aws_lb" "my_lb" {
  name               = "my-lb"
  internal           = false
  load_balancer_type = "application"
  subnets            = [aws_subnet.public_subnets[0].id, aws_subnet.public_subnets[1].id]
  enable_deletion_protection = false
  security_groups            = [aws_security_group.alb_sg.id]

  tags = {
    Name = "MyLoadBalancer"
  }
}

output "load_balancer_url" {
  value       = aws_lb.my_lb.dns_name
  description = "The URL of the Load Balancer"
}
