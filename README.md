# CloudWindows

A lightweight Linux desktop you can open in your browser using GitHub Codespaces.

## What it provides
- Ubuntu 24.04 container with XFCE desktop
- Browser access through noVNC on a private forwarded port
- 2-core Codespaces configuration to fit typical free-tier usage
- No Azure VM, Azure account, or paid server deployment required

## Start
Open **Code → Codespaces → Create codespace on main**. Wait for the desktop to start, then open the forwarded **Linux desktop (noVNC)** port 6080.

See [docs/SETUP.md](docs/SETUP.md) for usage, free allowance, billing safeguards, and limitations.

## Important limitations
This is a Linux desktop container, not a full virtual machine. Browser games and web apps are the best fit. Roblox through Sober is unofficial and is **not guaranteed** to work because Codespaces does not provide a dedicated GPU or promise the Android/virtualization features Sober may need.

GitHub's free Codespaces allowance is subject to current plan terms. Check your billing settings and disable paid overages before use.
