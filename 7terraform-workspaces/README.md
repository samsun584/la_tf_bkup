```bash
# create new workspace
terraform workspace new dev

# list terraform workspaces
terraform workspace list

# selecting one from available workspaces
terraform workspace select dev

# show selected terraform workspace
terraform workspace show

#plan the dev env
terraform plan -out=tfdev_plan -var env=dev

# apply the dev env
terraform apply tfdev_plan

# changing workspaces
terraform workspace new prod

# plan the prod deployment
terraform plan -out=tfprod_plan -var env=prod

# apply the prod deployment
terraform apply tfprod_plan
```

when using workspaces, tfstate is held by terraform with respect to specific workspace.<br>

