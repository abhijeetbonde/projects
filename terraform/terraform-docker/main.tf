terraform{
    required_providers {
        docker = {
            source = "kreuzwerker/docker"
            version = "~> 3.0.1"
        }
    }
}

provider "docker" {}

resource "docker_image" "nginx_cust"{
    name = "nginx"
    keep_locally = false
}

resource "docker_container" "nginx_terra"{
    image = docker_image.nginx_cust.name
    name = "terra-docker-nginx"

    ports {
        internal = 80
        external = 8080
    }
}