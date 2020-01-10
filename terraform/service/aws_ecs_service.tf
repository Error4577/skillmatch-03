resource "aws_ecs_service" "rails-service" {
  name            = "rails-service"
  cluster         = aws_ecs_cluster.skillmatch-ecs-cluster.id
  task_definition = aws_ecs_task_definition.skillmatch-task.arn
  desired_count   = 1
  launch_type     = "EC2"
}
