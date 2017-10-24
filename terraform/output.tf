output "webapp_public_ip" {
	value = "${aws_instance.web.public_ip}"
}

output "webapp_public_dns" {
	value = "${aws_instance.web.public_dns}"
}
