resource "aws_ecs_cluster" "test_cluster" {
  name = var.ecs_cluster_name
}

resource "aws_ecs_task_definition" "test_task" {
  family                   = var.ecs_task_name
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
  container_definitions    = <<EOF
  [
    {
      "name": "my-container",
      "image": "fkdevops/node-app-01:latest",
      "cpu": 256,
      "memory": 512,
      "portMappings": [
        {
          "containerPort": 3000,
          "hostPort": 3000,
          "protocol": "tcp"
        }
      ]
    }
  ]
  EOF
}

resource "aws_ecs_service" "my_service" {
  name            = var.ecs_service_name
  cluster         = aws_ecs_cluster.test_cluster.id
  task_definition = aws_ecs_task_definition.test_task.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  load_balancer {
    target_group_arn = aws_lb_target_group.ecs_service_tg.arn
    container_name   = "my-container"
    container_port   = 3000
  }

  network_configuration {
    subnets          = [aws_subnet.test_subnet.id]
    security_groups  = [aws_security_group.ecs_sg.id]
    assign_public_ip = true
  }
}