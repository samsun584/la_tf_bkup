variable "env" {
  description="env: dev or prod"
}

variable "image_name" {
  type= "map"
  description = "Image for contaienr"
  default = {
    dev = "ghost:latest"
    prod = "ghost:alpine"
  }
}

variable "container_name" {
  description= "Name of the cotnainer"
  default= {
    dev = "blog_dev"
    prod =  "blog_prod"
  }
}

variable "int_port" {
  description=  "Internal port for cotnaienr"
  default = "2368"
}

variable "ext_port" {
  description="External port for container"
  default={
    dev = "8081"
    prod = "80"
  }
}
