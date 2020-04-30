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

data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "default" {
  vpc_id = data.aws_vpc.default.id
}