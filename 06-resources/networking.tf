resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}
resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.0.0/24"

  tags = {
    Name      = "06-resources-private"
    ManagedBy = "Terraform"
    project   = "06-reseources"
  }

}
provider "aws" {
  region = "eu-north-1"

}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name      = "06-resources-main"
    ManagedBy = "Terraform"
    project   = "06-reseources"
  }

}
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
  tags = {
    Name      = "06-resources-main"
    ManagedBy = "Terraform"
    project   = "06-reseources"
  }

}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id

}