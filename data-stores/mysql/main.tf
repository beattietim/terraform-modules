variable "cluster_name" {
  description = "name of the cluster"
  type        = string
}

resource "aws_db_instance" "example" {
  identifier_prefix     = "terraform"
  engine                = "mysql"
  allocated_storage     = 10
  instance_class        = "db.t2.micro"
  name                  = "terraform"
  skip_final_snapshot   = true

  username              = "admin"
  password              = var.db_password
}