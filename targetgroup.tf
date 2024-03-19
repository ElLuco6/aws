# # Création du Target Group
# resource "aws_lb_target_group" "my_target_group" {
#   name        = "my-target-group"
#   port        = 80
#   protocol    = "HTTP"
#   vpc_id      = aws_vpc.my_vpc.id

#   health_check {
#     path                = "/"
#     protocol            = "HTTP"
#     timeout             = 5
#     interval            = 30
#     unhealthy_threshold = 2
#     healthy_threshold   = 2
#     matcher             = "200,301,302"
#   }
# }

# # Ajout des instances EC2 au Target Group
# resource "aws_lb_target_group_attachment" "my_target_group_attachment" {
#   target_group_arn = aws_lb_target_group.my_target_group.arn
#   target_id        = aws_instance.nginx_instance.id
#   port             = 80
# }
