variable "cluster_name" {
  description = "name for all cluster resources"
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

variable "ami" {
  description = "The AMI to run in the cluster"
  default     = "ami-0e26853e06c2cff5a"
  type        = string
}

variable "subnet_ids" {
  description = "subnet ids to deploy to"
  type        = list(string)
}

variable "target_group_arns" {
  description = "ARNs of ELB target groups to register instances"
  type        = list(string)
  default     = []
}

variable "user_data" {
  description = "User Data script to run in each Instance"
  type        = string
  default     = null
}