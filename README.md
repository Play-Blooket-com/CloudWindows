# CloudWindows

A low-cost cloud Windows desktop project.

## Target design
- Azure-hosted Windows Server 2022 with Desktop Experience
- Target VM: 2 vCPU / 4 GiB RAM, subject to availability and pricing
- Browser access: Chrome Remote Desktop
- No VirtualBox installed inside the cloud VM
- GitHub Actions for manual start and Azure deallocation
- Azure OIDC authentication; no long-lived credentials committed to this repository

## Cost and safety
Azure compute is billed while a VM is running. A VM must be **deallocated** to stop compute billing; managed disks, snapshots, IP resources, and bandwidth may still incur charges. Do not assume this Windows configuration is free. Check current region-specific pricing and subscription eligibility before deployment. No Azure resources should be created until the owner explicitly approves the estimated costs.

## Planned steps
1. Confirm subscription, region, quota, and pricing.
2. Prepare secure VM and remote-access configuration.
3. Configure GitHub Actions with Azure OIDC federated credentials.
4. Add manual start and deallocate workflows.
5. Add budget alerts and verify shutdown behavior.

## Security
- Never commit passwords, tokens, or private keys.
- Do not expose RDP (TCP 3389) to the entire internet.
- Keep this repository private before adding any sensitive configuration; secrets still belong in GitHub/Azure secret stores, not files.
