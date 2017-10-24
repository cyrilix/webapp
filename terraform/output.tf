output "webapp_public_ips" {
  value = "${aws_instance.web.*.public_ip}"
}

output "webapp_public_dns" {
  value = "${aws_instance.web.*.public_dns}"
}
