resource "aws_db_parameter_group" "default" {
  name        = "${var.name}"
  description = "${var.name} parameter group"
  family      = "${var.family}"
  parameter   = ["${var.parameter}"]
  tags        = "${merge(map("Name", var.name), var.tags)}"

  lifecycle {
    create_before_destroy = true
  }
}
