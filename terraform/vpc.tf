data "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Terraform = "true"
  }
}

data "aws_subnets" "public" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }

  tags = {
    Public = "true"
  }
}