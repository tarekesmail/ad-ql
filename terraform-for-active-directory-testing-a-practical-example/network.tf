# Define the security group for the Windows server
resource "aws_security_group" "aws-windows-sg" {
  name        = "windows-sg"
  description = "Allow incoming connections"
  vpc_id      = "vpc-003d2d2592d19bb7c"
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "all"
    cidr_blocks = ["1.1.1.1/32"]
    description = "Allow incoming connections from me"
  }
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "all"
    self        = true
    description = "Allow All Connections From VPC"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "windows-sg"
  }
}

# Define the security group for the Windows server
resource "aws_security_group" "aws-windows-private-sg" {
  name        = "windows-private-sg"
  description = "Allow incoming connections"
  vpc_id      = "vpc-003d2d2592d19bb7c"
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "all"
    self        = true
    description = "Allow All Connections From VPC"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "windows-private-sg"
  }
}
