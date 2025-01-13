resource "aws_s3_bucket" "state-s3" {
  bucket = "jp-tofu-state-s3"
}

resource "aws_s3_bucket_acl" "state-s3" {
  bucket = aws_s3_bucket.jp-tofu-state-s3.id
  acl    = "private"
 }

resource "aws_s3_bucket_versioning" versioning_enabled {
  bucket = "state-s3.id"
  versioning_configuration {
    status = "Enabled"
  }
}

data "aws_secretsmanager_secret_version" "database_password" {
    secret_id = "my-database-password"
}

resource "aws_db_instance" "my_secret_db" {
  identifier      = "rds-db-instance"
  allocated_storage = 20
  storage_type    = "gp2"
  engine          = "mysql"
  engine_version  = "5.7"
  instance_class  = "db.t3.micro"
  username        = "admin"
  password        = data.aws_secretsmanager_secret_version.database_password.secret_string # Using the retrieved secret value
}
