terraform {
  backend "s3" {
    bucket = "cyrille-tfstate-formation"
    key    = "webapp/terraform.tfstate"
    region = "eu-west-1"
  }
}
