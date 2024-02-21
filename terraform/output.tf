output "instance_ips" {
  value = aws_instance.tdengine_node.*.public_ip
}

