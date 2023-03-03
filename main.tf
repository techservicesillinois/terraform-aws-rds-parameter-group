locals {
  pg_name = format("%s-%s", var.prefix, replace(var.family, ".", "-"))
}

resource "aws_db_parameter_group" "default" {
  name        = local.pg_name
  description = format("%s parameter group", local.pg_name)
  family      = var.family

  dynamic "parameter" {
    for_each = var.parameter
    content {
      apply_method = parameter.value.apply_method
      name         = parameter.value.name
      value        = parameter.value.value
    }
  }
  tags = merge({ Name = var.prefix }, var.tags)

  lifecycle {
    create_before_destroy = true
  }
}
