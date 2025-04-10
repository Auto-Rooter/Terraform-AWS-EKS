provider "aws" {
  region = "eu-central-1"
}

resource "aws_vpc" "project_0_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "project-0-vpc"
  }
}

resource "aws_subnet" "project_0_subnet" {
  count = 2
  vpc_id = aws_vpc.project_0_vpc.id
  cidr_block = cidrsubnet(aws_vpc.project_0_vpc.cidr_block, 8, count.index)
  availability_zone = element(["eu-central-1a", "eu-central-1b"], count.index)
  map_public_ip_on_launch = true
    tags = {
        Name = "project-0-subnet-${count.index}"
    }
}

resource "aws_internet_gateway " "project_0_igw" {
  vpc_id = aws_vpc.project_0_vpc.id
  tags = {
    Name = "project-0-igw"
  }
}

resource "aws_route_table" "project_0_route_table" {
    vpc_id = aws_vpc.project_0_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.project_0_igw.id
    }
    tags = {
        Name = "project-0-route-table"
    }
}