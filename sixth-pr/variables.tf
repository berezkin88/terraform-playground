variable "user_names" {
  description = "Create IAM users with these names"
  type        = list(string)
  default     = ["oleks", "trinity", "morpheus"]
}

variable "custom_tags" {
  description = "Custom tags to set on the Instances in the ASG"
  type        = map(string)
  default     = {}
}

variable "names" {
  description = "A list of names"
  type        = list(string)
  default     = ["neo", "trinity", "morpheus"]
}
