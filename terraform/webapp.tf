provider aws {}

resource "aws_instance" "web" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"
  subnet_id     = "subnet-7b773e1c"
  key_name      = "cyrille3"

  tags {
    Name = "cyrille"
  }
}
