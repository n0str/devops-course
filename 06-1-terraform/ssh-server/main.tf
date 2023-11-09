terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "ssh_server" {
  name         = "ssh-server"
  keep_locally = true
}

resource "docker_container" "ssh_server" {
  image = docker_image.ssh_server.image_id
  name  = var.container_name
  ports {
    internal = 2222
    external = 2222
  }
  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible -i ./ansible/hosts all -a 'ip addr'"
  }
}
