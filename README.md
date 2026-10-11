
# Week 7 — Infrastructure as Code with OpenTofu

This project deploys an Ubuntu web server on the CSC cPouta OpenStack cloud using OpenTofu.

## Requirements

- OpenTofu
- Access to the CSC cPouta OpenStack project
- An OpenStack application credential configured in `clouds.yaml`
- An SSH key pair

## Configuration

1. Copy `terraform.tfvars.example` to `terraform.tfvars`.
2. Set your project network name, public SSH key path, public IP in CIDR notation, and student name.
3. Make sure `clouds.yaml` is configured for the OpenStack provider.

## Deploy

Run the following commands in the project directory:

```powershell
tofu init
tofu fmt
tofu validate
tofu plan
tofu apply
```

Review the plan before applying it and type `yes` when prompted.

## Access

After deployment, OpenTofu prints the web server's public IP address and URL.

## Cleanup

To remove the resources managed by this project, run:

```powershell
tofu destroy
```
