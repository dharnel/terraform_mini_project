# create target group
# terraform aws create target group
resource "aws_lb_target_group" "alb_target_group" {
  name        = "my-target-group"
  target_type = "instance"
  port        = "80"
  protocol    = "HTTP"
  vpc_id      = aws_vpc.my_custom_vpc.id

  health_check {
    path       = "/"
    protocol = "HTTP"
    matcher  = "200"
    interval = 15
    timeout = 3
    healthy_threshold = 3
    unhealthy_threshold = 3
  }

}



resource "aws_lb_target_group_attachment" "attachment1" {
  target_group_arn = aws_lb_target_group.alb_target_group.arn
  target_id        = aws_instance.web_instance1.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "attachment2" {
  target_group_arn = aws_lb_target_group.alb_target_group.arn
  target_id        = aws_instance.web_instance2.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "attachment3" {
  target_group_arn = aws_lb_target_group.alb_target_group.arn
  target_id        = aws_instance.web_instance3.id
  port             = 80
}