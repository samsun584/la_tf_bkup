variable "image_name" {
  description = "Image for contaienr"
  default = "ghost:latest"
}

variable "container_name" {
  description= "Name of the cotnainer"
  default= "blog"
}

variable "int_port" {
  description=  "Internal port for cotnaienr"
  default = "2368"
}

variable "ext_port" {
  description="External port for container"
}

# Download the latet Ghost image
resource "docker_image" "image_id" {
 name= "${var.image_name}"
}

# Start the container
resource "docker_container" "container_id" {
  name="${var.container_name}"
  image="${docker_image.image_id.latest}"
  ports {
    internal = "${var.int_port}"
    external = "${var.ext_port}"
  }
}

#Output the IP Address of the Container
output "ip_address" {
  value       = "${docker_container.container_id.ip_address}"
  description = "The IP for the container."
}

#Output the Name of the Container
output "container_name" {
  value       = "${docker_container.container_id.name}"
  description = "The name of the container."
}

