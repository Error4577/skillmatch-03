resource "aws_ecs_service" "rails-service" {
  name            = "rails-service"
  cluster         = aws_ecs_cluster.skillmatch-ecs-cluster.id
  task_definition = aws_ecs_task_definition.skillmatch-task.arn
  desired_count   = 1
  launch_type     = "EC2"

  load_balancer {
    target_group_arn = aws_lb_target_group.http.arn
    container_name   = "skillmatch"
    container_port   = "3000"
  }
}
