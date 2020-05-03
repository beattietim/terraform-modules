variable "db_remote_state_bucket" {
  description = "name of the s3 bucket for the database's remote state"
  type        = string
}

variable "db_remote_state_key" {
  description = "s3 path for the database's remote state"
  type        = string
}

variable "server_text" {
  description = "The test the web sever should return"
  default     = "Hello, world"
  type        = string
}