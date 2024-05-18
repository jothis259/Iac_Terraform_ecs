variable "aws_region" {
  description = "ap-south-"
}

variable "ecr_repository_name" {
  description = "ECR-repo"
}

variable "ecs_cluster_name" {
  description = "ECS-cluster"
}

variable "task_definition_family" {
  description = "ECS-task-definition"
}

variable "container_name" {
  description = "ECS-container"
}

variable "container_cpu" {
  description = "CPU units for the container"
}

variable "container_memory" {
  description = "Memory for the container"
}

variable "container_port" {
  description = "Port on which the container listens"
}

variable "service_name" {
  description = "Name of the ECS service"
}

variable "service_desired_count" {
  description = "Desired number of tasks to run"
}

variable "service_launch_type" {
  description = "Launch type for the ECS service (FARGATE or EC2)"
}

variable "subnets" {
  description = "Subnets where the ECS tasks will be deployed"
  type        = list(string)
}

variable "security_groups" {
  description = "Security groups for the ECS tasks"
  type        = list(string)
}

variable "assign_public_ip" {
  description = "Whether to assign a public IP to the ECS tasks"
  type        = bool
}
