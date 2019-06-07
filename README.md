# terraform-aws-rds-parameter-group module

Terraform module which creates terraform-aws-rds-parameter-group on AWS.

## Usage

```hcl
module "rds-parameter-group" {
  source = "git@github.com:techservicesillinois/terraform-aws-rds-parameter-group"

  name               = "service-name"
  
  redis_clusters     = "2"

}
```

Argument Reference
-----------------

The following arguments are supported:

* `name` - (Required) The name of the DB parameter group. If omitted, Terraform will assign a random, unique name. 

* `family` - (Required) The family of the DB parameter group. 

* `parameter` - (Optional) A list of DB parameters to apply. Note that parameters may differ from a family to an other. Full list of all parameters can be discovered via aws rds describe-db-parameters after initial creation of the group. 

* `tags` - (Optional) A mapping of tags to assign to the resource. 


Attributes Reference
--------------------

The following attributes are exported:

* `id` - The db parameter group name. 

* `name` - The name of the db parameter group. 
