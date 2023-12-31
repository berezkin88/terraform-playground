provider "aws" {
  region = "eu-central-1"
}

# resource "aws_iam_user" "example" {
#   count = length(var.user_names)
#   name  = var.user_names[count.index]
# }

# resource "aws_iam_user" "example" {
#   for_each = toset(var.user_names)
#   name = each.value
# }

# output "all_arns" {
#   value       = aws_iam_user.example[*].arn
#   description = "The ARNs for all users"
# }

# output "all_users" {
#   value = aws_iam_user.example
# }

# output "all_arns" {
#   value       = values(aws_iam_user.example)[*].arn
#   description = "The ARNs for all users"
# }

# module "webserver_cluster" {
#   source = "../modules/services/webserver-cluster"

#   cluster_name = "ebserver-prod"
#   db_remote_state_bucket = "terraform-up-and-running-state-birch-example"
#   db_remote_state_key = "prod/data-stores/mysql/terraform.tfstate"

#   instance_type = "m2.micro"

#   min_size = 2
#   max_size = 10

#   custom_tags = {
#     Owner = "team-foo"
#     ManagedBy = "terraform"
#   }
# }

# resource "aws_autoscaling_group" "example" {
#   launch_configuration = aws_launch_configuration.example.name
#   vpc_zone_identifier  = data.aws_subnets.default.ids
#   target_group_arns    = [aws_lb_target_group.asg.arn]
#   health_check_type    = "ELB"

#   min_size = var.min_size
#   max_size = var.max_size

#   tag {
#     key                 = "Name"
#     value               = var.cluster_name
#     propagate_at_launch = true
#   }

#   dynamic "tag" {
#     for_each = var.custom_tags

#     content {
#       key = tag.key
#       value = tag.value
#       propagate_at_launch = true
#     }
#   }
# }

output "names" {
  value = [for name in var.names : upper(name) if length(name) < 5]
}

variable "hero_thousand_faces" {
  description = "map"
  type        = map(string)
  default     = {
    neo      = "hero"
    trinity  = "love interest"
    morpheus = "mentor"
  }
}

output "bios" {
  value = [for name, role in var.hero_thousand_faces : "${name} is the ${role}"]
}

output "upper_roles" {
  value = {for name, role in var.hero_thousand_faces : upper(name) => upper(role)}
}

output "for_directive" {
  value = "%{ for name in var.names }${name}, %{endfor}"
}
