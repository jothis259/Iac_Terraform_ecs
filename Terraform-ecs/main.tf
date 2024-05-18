# Define provider (AWS)
provider "aws" {
  region = var.ap-south-1
}

# Create ECR repository
resource "aws_ecr_repository" "hello_world" {
  name = var.ecr_repository_name
}

# Create ECS cluster
resource "aws_ecs_cluster" "main" {
  name = var.ecs_cluster_name
}

# Define Task Definition
resource "aws_ecs_task_definition" "hello_world" {
  family                   = var.task_definition_family
  container_definitions    = jsonencode([{
    name      = var.container_name,
    image     = aws_ecr_repository.hello_world.repository_url,
    cpu       = var.container_cpu,
    memory    = var.container_memory,
    essential = true,
    portMappings = [{
      containerPort = var.container_port,
      hostPort      = var.container_port,
      protocol      = "tcp",
    }]
  }])
}

# Create ECS Service
resource "aws_ecs_service" "hello_world" {
  name            = var.service_name
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.hello_world.arn
  desired_count   = var.service_desired_count
  launch_type     = var.service_launch_type
  network_configuration {
    subnets         = var.subnets
    security_groups = var.security_groups
    assign_public_ip = var.assign_public_ip
  }
}
