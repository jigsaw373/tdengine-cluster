resource "null_resource" "generate_inventory" {
  depends_on = [aws_instance.tdengine_node]

  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = "${path.module}/generate_inventory.sh ${join(" ", aws_instance.tdengine_node.*.public_ip)}"
  }
}