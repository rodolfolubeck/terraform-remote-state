resource "aws_instance" "web" {
  ami           = "ami-0e8e3b3607e99ee4e"
  instance_type = "t2.micro"

  tags = {
    Name = "Remote State"
    Env  = "dev"
  }
}