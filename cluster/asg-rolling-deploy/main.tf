locals {
  http_port     = 80
  any_port      = 0
  any_protocol  = "-1"
  tcp_protocol  = "tcp"
  all_ips       = ["0.0.0.0/0"]
}

resource "aws_launch_configuration" "example" {
  image_id = var.ami
  instance_type = var.instance_type
  security_groups = [aws_security_group.web.id]

  user_data = var.user_data

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "example-asg" {
  name = "${var.cluster_name}-${aws_launch_configuration.example.name}"

  launch_configuration  = aws_launch_configuration.example.name
  vpc_zone_identifier   = var.subnet_ids

  target_group_arns = var.target_group_arns
  health_check_type = "ELB"

  min_size = var.min_size
  max_size = var.max_size

  min_elb_capacity = var.min_size

  lifecycle {
    create_before_destroy = true
  }

  tag {
    key                 = "Name"
    value               = var.cluster_name
    propagate_at_launch = true
  }

  dynamic "tag" {
    for_each = var.custom_tags

    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }
}

resource "aws_security_group" "web" {
  name = "${var.cluster_name}-web-instance"
}

resource "aws_security_group_rule" "instance-inbound" {
  type = "ingress"
  security_group_id = aws_security_group.web.id

  from_port   = var.webserver_port
  to_port     = var.webserver_port
  protocol    = local.tcp_protocol
  cidr_blocks = local.all_ips
}
