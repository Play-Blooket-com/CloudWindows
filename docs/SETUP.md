# CloudWindows setup

This repository currently contains **manual-only** GitHub Actions for starting and deallocating one Azure VM. They do not run on pushes, pull requests, or a schedule. They cannot create a VM.

## Required GitHub configuration

After the Azure identity and VM exist, configure these repository settings:

### Actions secrets

- `AZURE_CLIENT_ID` — Microsoft Entra application or user-assigned managed identity client ID
- `AZURE_TENANT_ID` — Microsoft Entra tenant ID
- `AZURE_SUBSCRIPTION_ID` — Azure subscription ID

### Actions variables

- `AZURE_RESOURCE_GROUP` — resource group containing the VM
- `AZURE_VM_NAME` — exact VM name

Do not put credential values in this repository, workflow files, README, or commit history.

## Azure identity and permissions

The workflows use `azure/login@v3` with GitHub OIDC. Before they can work, an administrator must configure a federated identity credential in Microsoft Entra that trusts this exact GitHub repository and the `ref:refs/heads/main` subject.

Grant the identity only the permissions it needs on the target VM/resource scope:
- Read the VM and its instance state
- Start the VM
- Deallocate the VM

Avoid granting broad subscription-wide Owner or Contributor access. A narrowly scoped custom role is preferable. Do not create the identity or assign roles until the subscription, scope, and cost implications have been reviewed.

## Run the workflows

In GitHub, open **Actions**:
- **Start CloudWindows VM** → **Run workflow**
- **Deallocate CloudWindows VM** → **Run workflow**

Only people with sufficient repository permissions can manually dispatch workflows. The workflows are intentionally not scheduled and do not run automatically.

## Cost behavior

Deallocation stops VM compute billing. It does **not** necessarily stop charges for managed disks, snapshots, public IP addresses, backups, or network usage. Verify the VM reaches the deallocated state in the Azure portal after running the deallocation workflow.

## Current status

No Azure resources, identities, role assignments, or GitHub secrets are created by these files. The workflows will fail safely until their required configuration is supplied.
