variable "region" {
    description = "The AWS region"
    default = "us-east-1"
}

variable "d_secrets" {
  default = {
    secret_name = "my-secret-2"
    secret_arn = "arn:aws:secretsmanager:us-east-1:381492112805:secret:my-secret-2-o0RNv5"
  }

  type = map(string)
}

resource "aws_secretsmanager_secret_version" "my-secret-2" {
  secret_id     = aws_secretsmanager_secret.my-secret-2.id
  secret_string = jsonencode(var.d_secrets)
