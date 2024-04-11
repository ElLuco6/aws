# Création de l'instance EC2 Ubuntu avec Nginx
resource "aws_instance" "mern_instance" {
  ami                    = "ami-00c71bd4d220aa22a"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.private_subnets[0].id
  key_name               = aws_key_pair.my_key.key_name
  vpc_security_group_ids = [aws_security_group.mern_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              apt-get update
              apt-get install -y apt-transport-https ca-certificates curl software-properties-common
              curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
              add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
              apt-get update
              apt-get install -y docker-ce git
              curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
              chmod +x /usr/local/bin/docker-compose
              git clone https://github.com/bezkoder/docker-mern-nginx
              cd docker-mern-nginx
              sudo usermod -aG docker $USER
              docker-compose up -d
              EOF

  tags = {
    Name = "Mern Server"
  }
}
