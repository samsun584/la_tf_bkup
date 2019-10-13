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
  default="80"
}
