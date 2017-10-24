data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

variable "vpc_id" {
  default = "vpc-d02679b7"
}

variable "subnet_id_1" {
  default = "subnet-7b773e1c"
}

variable "subnet_id_2" {
  default = "subnet-63dc4938"
}
