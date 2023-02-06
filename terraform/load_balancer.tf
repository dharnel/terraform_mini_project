#create load balancer
resource "aws_lb" "custom_lb" {
  name               = "my-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb.id]
  subnets            = [aws_subnet.public_az1.id, aws_subnet.public_az2.id]
  enable_deletion_protection = false

  tags = {
    Environment = "load-balancer"
  }

  depends_on = [
    aws_instance.web_instance1, aws_instance.web_instance2, aws_instance.web_instance3
  ]
}

# create a listener on port 80 with redirect action
# terraform aws create listener
resource "aws_lb_listener" "alb_http_listener" {
  load_balancer_arn = aws_lb.custom_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.alb_target_group.arn

  }
}

resource "aws_lb_listener_rule" "alb_http_listener_rule" {
  listener_arn = aws_lb_listener.alb_http_listener.arn
  priority = 1

  action {
    type = "forward"
    target_group_arn = aws_lb_target_group.alb_target_group.arn

  }
  condition {
    path_pattern {
      values = ["/"]
    }
  }
}
