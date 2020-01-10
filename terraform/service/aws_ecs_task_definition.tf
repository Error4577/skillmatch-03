resource "aws_ecs_task_definition" "skillmatch-task" {
  family                = "rails-service"
  container_definitions = data.template_file.service_container_definition.rendered
  task_role_arn         = data.terraform_remote_state.aws_iam.outputs.ecs_task_role_arn
  network_mode          = "bridge"
}
