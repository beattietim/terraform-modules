locals {
  http_port     = 80
  any_port      = 0
  any_protocol  = "-1"
  tcp_protocol  = "tcp"
  all_ips       = ["0.0.0.0/0"]
}

resource "aws_autoscaling_schedule" "scale_out_during_business_hours" {
  count = var.enable_autoscaling ? 1 : 0

  autoscaling_group_name  = aws_autoscaling_group.example-asg.name
  scheduled_action_name   = "scale-out-during-business-hours"
  min_size                = 2
  max_size                = 10
  desired_capacity        = 10
  recurrence              = "0 9 * * *"
}

resource "aws_autoscaling_schedule" "scale_in_at_night" {
  count = var.enable_autoscaling ? 1 : 0

  autoscaling_group_name  = aws_autoscaling_group.example-asg.name
  scheduled_action_name   = "scale-in-at-night"
  min_size                = 2
  max_size                = 10
  desired_capacity        = 2
  recurrence              = "0 17 * * *"
}