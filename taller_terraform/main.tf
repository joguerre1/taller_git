#Declarar un proovedor
provider "aws"{
    region = "us-east-1"
    profile = "dev"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  tags = {
    Name = "web"
  }
}

resource "aws_instance" "bd" {
  ami           = "ami-0aa7d40eeae50c9a9"
  instance_type = "t2.micro"

  tags = {
    Name = "bd"
  }
}

resource "aws_instance" "backend" {
  ami           = "ami-00874d747dde814fa"
  instance_type = "t2.micro"

  tags = {
    Name = "backend"
  }
}

#Consultas de Datos- (opcional)

#Ciclo de vida Terraform

#Inicializar: terraform init

#verificar diseño: terraform plan

#Aplicar El diseño: terraform apply

#Destruir infraestructura: terraform destroy