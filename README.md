# Week 7 — Infrastructure as Code with OpenTofu

This project deploys an Ubuntu web server on the CSC cPouta OpenStack cloud using OpenTofu. The configuration creates a virtual machine, network port, floating IP, SSH key pair, and security group with rules for SSH, HTTP, and HTTPS traffic.

## Requirements

- OpenTofu
- Access to the CSC cPouta OpenStack project
- An OpenStack application credential configured in `clouds.yaml`
- An SSH key pair

## Configuration

1. Copy `terraform.tfvars.example` to `terraform.tfvars`.
2. Set the project network name, public SSH key path, SSH allowed CIDR, and student name.
3. Configure `clouds.yaml` with valid OpenStack application credentials.
4. Make sure the public SSH key exists at the configured path.

Do not commit `clouds.yaml`, `terraform.tfvars`, or OpenTofu state files to Git.

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

The server uses cloud-init to install Apache and create a custom web page.

## Access

After deployment, OpenTofu prints the web server's public IP address, URL, and SSH command.

- Open the output URL in a browser to check the website.
- Use the output SSH command to connect to the server.

The security group allows SSH on port 22 from the configured IP range and HTTP on port 80 and HTTPS on port 443 from any IPv4 address. Opening port 443 alone does not configure TLS or enable HTTPS on the web server.

## Experiments

The experiments for this assignment are documented in the accompanying report.

- **Experiment 1 — Configuration changes:** Changed the web page message and added an HTTPS security group rule. Observed how OpenTofu planned and applied the changes.
- **Experiment 2 — Drift detection:** Manually deleted the HTTP rule and checked whether OpenTofu detected and restored it. Also tested a manually added TCP port 8080 rule.
- **Experiment 3 — Destroy and re-create:** Destroyed the managed infrastructure, reviewed the recreation plan, and deployed the resources again.

## Cleanup

To remove the resources managed by this project, run:

```powershell
tofu destroy
```

Review the destruction plan carefully before confirming. The existing project network is referenced by a data source and is not managed or deleted by this configuration.