# Download the latet Ghost image
resource "docker_image" "image_id" {
 name= "ghost:latest"
}

# Start the container
resource "docker_container" "container_id" {
  name="ghost_blog"
  image="${docker_image.image_id.latest}"
  ports {
    internal = "2368"
    external = "80"
  }
}
