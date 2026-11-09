provider "aws" {
  region = "us-east-1" 
}

# 1. S3 Bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = "terraform-basics-elsanousy-2026" 
  tags = {
    Name        = "MyTerraformBucket"
    Environment = "Dev"
  }
}

# 2. Security Group
resource "aws_security_group" "web_sg" {
  name        = "allow_ssh_only"
  description = "Allow SSH from my IP only"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip] 
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# 3.EC2 Instance
resource "aws_instance" "web_server" {
  ami           = "ami-0c7217cdde317cfec" # Ubuntu 22.04 in us-east-1
  instance_type = "t2.micro"              
  security_groups = [aws_security_group.web_sg.name]

  tags = {
    Name = "TerraformWebServer"
  }
}