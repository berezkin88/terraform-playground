// run with terraform init -backend-config=backend.hcl
bucket = "terraform-up-and-running-state-birch-example"
region = "eu-central-1"
dynamodb_table = "terraform-up-and-running-locks"
encrypt = true