resource "aws_security_group" "tdengine_sg" {
  name        = "tdengine-cluster-sg"
  description = "Allow traffic for TDengine cluster"

  # SSH access
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Be restrictive here for production
  }

  # TDengine default port
  ingress {
    from_port   = 6030
    to_port     = 6030
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Adjust based on your network setup
  }

  # HTTP access
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Be restrictive here for production
  }

  # HTTPS access
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Be restrictive here for production
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
