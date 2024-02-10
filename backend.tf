terraform {
  backend "s3" {
    bucket = "comunidade-tfstate-us-east-2-02"
    key    = "infra-comunidade-tf-infra-lab-us-east-2"
    region = "us-east-2"
  }
}