provider aws {}

resource "aws_security_group" "sg_webapp" {
  vpc_id = "${data.terraform_remote_state.vpc.vpc_id}"

  tags {
    Name = "cyrille"
  }
}

resource "aws_security_group_rule" "allow_http" {
  type        = "ingress"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.sg_webapp.id}"
}

resource "aws_security_group_rule" "allow_ssh" {
  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.sg_webapp.id}"
}

resource "aws_security_group_rule" "allow_all" {
  type              = "egress"
  to_port           = 0
  from_port         = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.sg_webapp.id}"
}

resource "aws_instance" "web" {
  ami                         = "${data.aws_ami.ubuntu.id}"
  count                       = 2
  instance_type               = "t2.micro"
  subnet_id                   = "${element(data.terraform_remote_state.vpc.subnet_ids, count.index) }"
  key_name                    = "cyrille3"
  associate_public_ip_address = true
  vpc_security_group_ids      = ["${aws_security_group.sg_webapp.id}"]
  user_data                   = "${data.template_file.webapp_userdata.rendered}"

  tags {
    Name = "cyrille"
  }
}
