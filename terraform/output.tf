output "webapp_public_ips" {
  value = "${aws_instance.web.*.public_ip}"
}

output "webapp_public_dns" {
  value = "${aws_instance.web.*.public_dns}"
}

output "webapp_elb_dns" {
  value = "${aws_elb.web_elb.dns_name}"
}
