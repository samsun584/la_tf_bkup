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

when using workspaces, tfstate is held by terraform with respect to specific workspace.<br>

When using local-exec provisioner, it only executes the specified command on the machine running terraform but not on the resource.<br>

To run the command on the resource, we need to use `remote-exec` provisioner instead of `local-exec` provisioner.<br>

