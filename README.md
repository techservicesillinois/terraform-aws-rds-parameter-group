# rds-parameter-group

[![Terraform actions status](https://github.com/techservicesillinois/terraform-aws-rds-parameter-group/workflows/terraform/badge.svg)](https://github.com/techservicesillinois/terraform-aws-rds-parameter-group/actions)

Manage an RDS parameter group.

## Usage

```hcl
module "rds-parameter-group" {
  source = "git@github.com:techservicesillinois/terraform-aws-rds-parameter-group"

  # Family must match RDS instance's engine version.
  family = "mariadb10.6"

  # Prefix for parameter group name.
  prefix = "authman"

  parameter = [
    {
      name  = "character_set_client"
      value = "utf8"
    },

    {
      name  = "character_set_connection"
      value = "utf8"
    }
  ]
}
```

Argument Reference
-----------------

The following arguments are supported:

* `family` - (Required) Parameter group family (engine and version)"

* `parameter` - (Optional) List containing map of parameters to include in the parameter group. Note that parameters differ from one RDS family to another. A full list of all parameters can be discovered via the AWS command line interface by running `aws rds describe-db-parameters` after creation of a parameter group.

* `prefix` - (Required) Prefix for parameter group name. The full name is generated from the prefix and the family. The prefix may contain only letters, digits, or hyphens. See [Working with DB parameter groups](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_WorkingWithDBInstanceParamGroups.html) for additional restrictions.

* `tags` - (Optional) Tags to be applied to resources where supported.

`parameter`
----------

A `parameter` block consists of a list containing one or more objects, each of which may contain the following attributes:

* `apply_method` - (Optional) XXX. The valid values consist of `immediate` or `pending-reboot`."immediate" (default), or "pending-reboot". Some engines can't apply some parameters without a reboot, and you will need to specify "pending-reboot" here.

* `autoscale_scale_down` - (Optional) The name of the autoscaling policy for scale down. Default name is ('service name'-down)

* `adjustment_type` - (Required) Specifies whether the adjustment is an absolute number or a percentage of the current capacity. Valid values are ChangeInCapacity, ExactCapacity, and PercentChangeInCapacity.

Attributes Reference
--------------------

The following attributes are exported:

* `arn` - The Amazon Resource Name of the parameter group.

* `name` - The name of the db parameter group.
