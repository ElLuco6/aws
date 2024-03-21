# Création du Load Balancer Application
resource "aws_lb" "my_lb" {
  name               = "my-lb"
  internal           = false
  load_balancer_type = "application"
  subnets            = [aws_subnet.public_subnets[0].id, aws_subnet.public_subnets[1].id]

  enable_deletion_protection = false

  tags = {
    Name = "MyLoadBalancer"
  }
}

output "load_balancer_url" {
  value       = aws_lb.my_lb.dns_name
  description = "The URL of the Load Balancer"
}