resource "aws_lb_target_group" "test" {
  name     = "${var.target_group_name}"
  port     = "${var.target_group_port}"
  protocol = "${var.target_group_protocol}"
  vpc_id   = "${var.vpc_id}"
}
