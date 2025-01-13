provider "aws" {
    region = "us-east-1"
}

resource "aws_secretsmanager_secret" "d_secrets" {
    name = "my-secret-2"
}

resource "aws_secretsmanager_secret_version" "my-secret-2" {
  secret_id     = aws_secretsmanager_secret.my-secret-2.id
  secret_string = jsonencode(var.d_secrets)
}
