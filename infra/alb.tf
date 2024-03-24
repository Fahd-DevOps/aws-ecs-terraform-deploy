resource "aws_lb" "app_lb" {
  name               = var.alb_name
  internal           = false
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = [aws_subnet.test_subnet.id, aws_subnet.test_subnet_2.id]
  load_balancer_type = "application"
}

resource "aws_lb_target_group" "ecs_service_tg" {
  name        = var.lb_target_group
  port        = 3000
  protocol    = "HTTP"
  vpc_id      = aws_vpc.test_vpc.id
  target_type = "ip"

  health_check {
    interval            = 30
    path                = "/health"
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 5
  }
}

resource "aws_lb_listener" "app_listener" {
  load_balancer_arn = aws_lb.app_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.ecs_service_tg.arn
    type             = "forward"
  }
}
