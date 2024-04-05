resource "aws_key_pair" "this" {
  key_name   = "key_pair"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDEZE3ijnhBHy7VLC23g+tX6vmAba6iLEPHUHVE+nKO/em4ZcY4g1eFeA0LAHeVyTL6tX6Lwi9DFIqPoB5d3qXramc3cCmiKHOsJZJjVUWqII5ENmZJKqMCi3FeLScPfBb9jAXzKBHswaFgPPYkmrrZuz5SwTM+7BLAuB1GOM/7n+lEBkSACjcLl9fF2mMagLaWreC+jFWP0zDDKgGsKnUQIJl9ofmXtW02YJ5WoP+fn3DyZNm3q3kJHR8QhAoY7PKuh5289610/nudZA4DxdKkdHC2ZRwP+/MUGiACopuOKePq8POb+v/A965P7d+tOMsNrVKkdLjRyQn0BsWlnVMT josephines@MacBook-Air-de-Josephine.local"
}

resource "aws_security_group" "bastion" {
  name   = "bastion_ssh"
  vpc_id = aws_vpc.main.id

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_instance" "bastion" {
  instance_type   = "t2.micro"
  ami             = "ami-021d41cbdefc0c994"
  security_groups = [aws_security_group.bastion.id]
  subnet_id       = aws_subnet.public_1.id
  key_name        = aws_key_pair.this.key_name

  tags = {
    TerraformId = "bastion"
  }
}
