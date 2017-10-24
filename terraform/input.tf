data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "template_file" "webapp_userdata" {
  template = "${file("userdata.tpl")}"
}

data "terraform_remote_state" "vpc" {
  backend = "s3"

  config {
    bucket = "cyrille-tfstate-formation"
    key    = "vpc/terraform.tfstate"
    region = "eu-west-1"
  }
}
