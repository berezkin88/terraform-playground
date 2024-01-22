terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
  alias = "region_1"
}

provider "aws" {
  region = "eu-west-1"
  alias = "region_2"
}

data "aws_region" "region_1" {
  provider = aws.region_1
}

data "aws_region" "region_2" {
  provider = aws.region_2
}

output "region_1" {
  value = data.aws_region.region_1
  description = "The name of the first region"
}

output "region_2" {
  value = data.aws_region.region_2
  description = "The name of the second region"
}

resource "aws_instance" "region_1" {
  provider = aws.region_1

  ami           = "ami-0232c5700a90a2ca6"
  instance_type = "t2.nano"
}
