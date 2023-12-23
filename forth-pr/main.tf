provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0232c5700a90a2ca6"
  instance_type = "t2.nano"
}

terraform {
  backend "s3" {
    bucket         = "terraform-up-and-running-state-birch-example"
    key            = "workspaces-example/terraform.tfstate"
    region         = "eu-central-1"

    dynamodb_table = "terraform-up-and-running-locks"
    encrypt        = true
  }
}
