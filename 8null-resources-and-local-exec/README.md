##### commands for current exercise: RUNNING LOCAL-EXEC PROVISIONER IN NULL RESOURCE

```bash
# list terraform workspaces
terraform workspace list

# selecting one from available workspaces
terraform workspace select dev

# run init again, as we added new null provider
terraform init

#plan the dev env
terraform plan -out=tfdev_plan -var env=dev

# apply the dev env
terraform apply tfdev_plan

# destroy the resources
terraform destroy -var env=dev -auto-approve
```

`main.tf` contents
```
# Download the latest Ghost Image
resource "docker_image" "image_id" {
  name = "${lookup(var.image_name, var.env)}"
}

# Start the Container
resource "docker_container" "container_id" {
  name  = "${lookup(var.container_name, var.env)}"
  image = "${docker_image.image_id.latest}"
  ports {
    internal = "${var.int_port}"
    external = "${lookup(var.ext_port, var.env)}"
  }
}

resource "null_resource" "null_id" {
  provisioner "local-exec" {
    command = "echo ${docker_container.container_id.name}:${docker_container.container_id.ip_address} >> container.txt"
  }
}
```

when using workspaces, tfstate is held by terraform with respect to specific workspace.<br>

When using local-exec provisioner, it only executes the specified command on the machine running terraform but not on the resource.<br>

To run the command on the resource, we need to use `remote-exec` provisioner instead of `local-exec` provisioner.<br>

