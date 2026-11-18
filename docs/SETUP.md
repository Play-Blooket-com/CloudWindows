# CloudWindows — GitHub Codespaces setup

This version uses a Linux desktop inside GitHub Codespaces. It does **not** create an Azure VM or any other paid cloud server.

## Start the desktop

1. Open this repository on GitHub.
2. Select **Code** → **Codespaces** → **Create codespace on main**.
3. If GitHub asks for a machine type, choose **2 cores** to stay within the free compute allowance.
4. Wait for the container to build. The XFCE desktop starts automatically.
5. Open the forwarded **Linux desktop (noVNC)** port (6080). The port is configured as private, so GitHub authentication protects access.

If the desktop does not open automatically, open the **Ports** panel in the Codespace and click the forwarded port 6080.

## Free usage and avoiding charges

GitHub Free currently includes 120 core-hours per month for Codespaces and 15 GB-month of storage. Compute is measured in core-hours:
- 2-core machine: 2 core-hours per clock hour.
- About 1 hour/day for 30 days: about 60 core-hours.
- This leaves roughly 60 core-hours for other Codespaces usage during that billing month.

The allowance is subject to GitHub's current plan terms and account eligibility; GitHub may change its plans. Check the current billing page before relying on it: https://docs.github.com/en/billing/concepts/product-billing/github-codespaces

Set an automatic idle timeout in your GitHub Codespaces settings (30 minutes is a sensible starting point), and stop the Codespace when finished. A stopped Codespace still uses storage, so delete it when you no longer need it. Monitor usage and spending limits in GitHub Settings → Billing and licensing → Usage.

**Important:** If your free allowance is exhausted, additional usage may be billable if spending is enabled. Set a $0 spending limit / disable paid usage where GitHub offers that control, and check the account billing settings before creating the Codespace. Do not assume usage will always be blocked automatically.

## Roblox / Sober compatibility

This is a lightweight Linux desktop in a container, not a full Linux virtual machine. It has no dedicated GPU and does not promise hardware acceleration, nested virtualization, Android container support, or compatibility with Sober. Sober is unofficial and may fail to launch or perform poorly in this environment. Test it before relying on this setup.

Browser-based HTML5 games and ordinary web browsing are more realistic targets. Performance depends on the Codespaces machine and the remote desktop connection.

## Security

- The forwarded desktop port is configured as **private**.
- Do not change port 6080 to public.
- Do not store passwords, tokens, or private keys in the repository.
- This Codespace is temporary development compute; it is not a permanently running server.

## Cost status

No Azure resources, Azure identities, or Azure credentials are needed for this design. Creating and running a Codespace consumes the included GitHub allowance; extra usage or storage may be billed if paid usage is enabled.
