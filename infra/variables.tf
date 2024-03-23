variable "aws_region" {
  default = "us-east-1"
}

variable "cidr" {
  default = "10.0.0.0/16"
}

variable "pub_sub_1" {
  default = "10.0.1.0/24"
}

variable "ecs_cluster_name" {
  default = "test-ecs-cluster"
}

variable "ecs_service_name" {
  default = "test-ecs-service"
}

variable "ecs_task_name" {
  default = "test-ecs-task"
}