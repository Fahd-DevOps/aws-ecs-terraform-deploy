resource "aws_ecs_cluster" "test_cluster" {
  name = var.ecs_cluster_name
}

resource "aws_ecs_task_definition" "test_task" {
  family                = var.ecs_task_name
  container_definitions = <<EOF
  [
    {
      "name": "my-container",
      "image": "fkdevops/hello-world-app:latest",
      "cpu": 256,
      "memory": 512,
      "portMappings": [
        {
          "containerPort": 3000,
          "hostPort": 0,
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

  network_configuration {
    subnets          = [aws_subnet.test_subnet.id]
    security_groups  = [aws_security_group.ecs_sg.id]
    assign_public_ip = true
  }
}