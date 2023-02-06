#Configuring the cloud provider to use for the assignment. In this case; "AWS"
provider "aws" {
    region = "eu-west-3"
    access_key = var.access_key
    secret_key = var.secret_key
}
