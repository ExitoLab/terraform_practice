#create key pair on aws
resource "aws_key_pair" "ssh_key" {
  key_name   = "ssh_key"
  public_key = var.public_key
  tags       = local.tags
}

# vpc
resource "aws_vpc" "vpc_1" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
}

#subnet 
resource "aws_subnet" "subnet_1" {
  cidr_block              = var.subnet_cidr_1
  vpc_id                  = aws_vpc.vpc_1.id
  map_public_ip_on_launch = "true"
  availability_zone       = data.aws_availability_zones.available.names[1]
}

#internet_gateway
resource "aws_internet_gateway" "gateway_1" {
  vpc_id = aws_vpc.vpc_1.id
}

#route_table
resource "aws_route_table" "route_table_1" {
  vpc_id = aws_vpc.vpc_1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway_1.id
  }
}

resource "aws_route_table_association" "route_subnet_1" {
  subnet_id      = aws_subnet.subnet_1.id
  route_table_id = aws_route_table.route_table_1.id
}

# ec2-instance
resource "aws_instance" "app_server" {
  ami                    = data.aws_ami.aws-linux.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.subnet_1.id
  vpc_security_group_ids = [aws_security_group.sg-instance.id]
  key_name               = var.ssh_key_name

  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = file(var.private_key_path)
  }

  tags       = local.tags
}