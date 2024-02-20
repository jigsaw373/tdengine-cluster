# Optional: EBS volumes for persistent storage
resource "aws_ebs_volume" "tdengine_data" {
  count             = length(var.workers)
  availability_zone = element(aws_instance.tdengine_node.*.availability_zone, count.index)
  size              = var.workers[count.index].size # Size in GiB
  type              = "gp2" # General Purpose SSD

  tags = {
    Name = "TDengineData-${count.index}"
  }
}

resource "aws_volume_attachment" "tdengine_data_attach" {
  count       = length(var.workers)
  device_name = "/dev/sdh"
  volume_id   = element(aws_ebs_volume.tdengine_data.*.id, count.index)
  instance_id = element(aws_instance.tdengine_node.*.id, count.index)
}
