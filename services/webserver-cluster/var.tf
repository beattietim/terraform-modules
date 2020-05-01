variable "cluster_name" {
  description = "name for all cluster resources"
  type        = string
}

variable "db_remote_state_bucket" {
  description = "name of the s3 bucket for the database's remote state"
  type        = string
}

variable "db_remote_state_key" {
  description = "s3 path for the database's remote state"
  type        = string
}

variable "instance_type" {
  description = "ec2 instance type"
  type        = string
}

variable "min_size" {
  description = "min size of the webserver cluster"
  type        = number
}

variable "max_size" {
  description = "max size of the webserver cluster"
  type        = number
}

variable "webserver_port" {
  description = "HTTP port"
  type        = number
  default     = 8081
}

variable "custom_tags" {
  description = "Custom tags to set on Instances of the ASG"
  type        = map(string)
  default     = {}
}

variable "enable_autoscaling" {
  description = "If true then enable auto scaling"
  type        = bool
}