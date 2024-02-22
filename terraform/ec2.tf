resource "aws_iam_instance_profile" "ec2_s3_profile" {
  name = "ec2-s3-profile"
  role = aws_iam_role.ec2_s3_access.name
}

resource "aws_instance" "tdengine_node" {
  count         = length(var.workers)
  ami           = var.ami # Use the appropriate AMI for your region and OS
  instance_type = var.workers[count.index].type
  key_name      = "tdengine" # Ensure you have this key pair created in AWS
  subnet_id     = aws_subnet.public_subnet.id
  associate_public_ip_address = true

  vpc_security_group_ids = [
    aws_security_group.tdengine_sg.id,
  ]

  iam_instance_profile = aws_iam_instance_profile.ec2_s3_profile.name

  tags = {
    Name = "TDengineNode-${count.index}"
  }
}