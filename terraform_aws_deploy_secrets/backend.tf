terraform {
    backend "s3" {
      bucket = "my-terraform-state-james2"
      key    = "state"
      region = "us-east-1"
    }
}