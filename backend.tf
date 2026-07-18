terraform {
  backend "s3" {
    bucket = "statestorebuk66"
    key    = "terraform/backend"
    region = "us-east-1"

  }
}