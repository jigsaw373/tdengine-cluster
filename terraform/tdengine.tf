resource "aws_instance" "tdengine_node" {
  count         = length(var.workers)
  ami           = var.ami # Use the appropriate AMI for your region and OS
  instance_type = var.workers[count.index].type
  key_name      = "tdengine" # Ensure you have this key pair created in AWS

  vpc_security_group_ids = [
    aws_security_group.tdengine_sg.id,
  ]

  tags = {
    Name = "TDengineNode-${count.index}"
  }
}