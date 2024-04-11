# Création du Target Group pour le port 80
resource "aws_lb_target_group" "my_target_group_80" {
  name     = "my-target-group-80"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.my_vpc.id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    timeout             = 5
    interval            = 30
    unhealthy_threshold = 2
    healthy_threshold   = 2
    matcher             = "200,301,302"
  }
}

# Ajout des instances EC2 au Target Group pour le port 80
resource "aws_lb_target_group_attachment" "my_target_group_attachment_80" {
  target_group_arn = aws_lb_target_group.my_target_group_80.arn
  target_id        = aws_instance.mern_instance.id
  port             = 80
}

# Création du Target Group pour le port 443
resource "aws_lb_target_group" "my_target_group_443" {
  name     = "my-target-group-443"
  port     = 443
  protocol = "HTTPS"
  vpc_id   = aws_vpc.my_vpc.id

  health_check {
    path                = "/"
    protocol            = "HTTPS"
    timeout             = 5
    interval            = 30
    unhealthy_threshold = 2
    healthy_threshold   = 2
    matcher             = "200,301,302"
  }
}

# Ajout des instances EC2 au Target Group pour le port 443
resource "aws_lb_target_group_attachment" "my_target_group_attachment_443" {
  target_group_arn = aws_lb_target_group.my_target_group_443.arn
  target_id        = aws_instance.mern_instance.id
  port             = 443
}
