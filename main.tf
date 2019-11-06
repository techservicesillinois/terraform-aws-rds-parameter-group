resource "aws_db_parameter_group" "default" {
  name        = var.name
  description = "${var.name} parameter group"
  family      = var.family
  dynamic "parameter" {
    for_each = var.parameter
    content {
      apply_method = lookup(parameter.value, "apply_method", "pending-reboot")
      name         = parameter.value["name"]
      value        = parameter.value["value"]
    }
  }
  tags = merge({ "Name" = var.name }, var.tags)

  lifecycle {
    create_before_destroy = true
  }
}
