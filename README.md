# niri-dotfiles

NixOS configuration for **ganymede** — an x86_64 machine running the [niri](https://github.com/YaLTeR/niri) Wayland compositor.

## Structure

```
.
├── flake.nix
├── flake.lock
├── hosts/
│   └── ganymede/
│       ├── default.nix             # Host entry point
│       └── hardware-configuration.nix
├── modules/
│   ├── nixos/
│   │   ├── audio.nix
│   │   ├── boot.nix
│   │   ├── desktop.nix             # niri, greetd, portals, XWayland
│   │   ├── fancontrol.nix          # nct6775 kernel module + lm_sensors
│   │   ├── gaming.nix              # Steam + gamemode
│   │   ├── networking.nix          # NetworkManager + resolved
│   │   ├── packages.nix            # System packages
│   │   ├── users.nix
│   │   └── virtualization.nix
│   └── home/
│       ├── default.nix
│       ├── desktop.nix             # Cursor, swayidle, XDG portals
│       └── programs.nix            # Neovim (nixvim) + shell config
└── config/
    ├── config.jsonc                # Waybar config
    └── style.css                   # Waybar stylesheet (Tokyo Night)
```

## Flake Inputs

| Input | Source |
|---|---|
| nixpkgs | nixos-unstable |
| home-manager | nix-community/home-manager |
| niri | sodiboo/niri-flake |
| nixvim | nix-community/nixvim |

## System Features

- **Compositor:** niri (Wayland) with XWayland support
- **Display manager:** greetd + tuigreet
- **Audio:** PipeWire (PulseAudio compat)
- **Portals:** xdg-desktop-portal-gtk + xdg-desktop-portal-wlr
- **Virtualization:** libvirtd + virt-manager
- **Gaming:** Steam + gamemode
- **Smartcard:** pcscd + opensc
- **Fan control:** nct6775 kernel module + lm_sensors

## Packages

| Category | Packages |
|---|---|
| Terminals | kitty, ghostty, alacritty |
| Editors | neovim (nixvim), zed-editor, vim |
| Browsers | firefox, chromium, brave |
| Launcher | fuzzel |
| File manager | thunar |
| Communication | vesktop, zoom-us |
| Shell | bash, starship, lsd, bat, btop |
| Other | fastfetch, git, wget, nmap, unzip |

## Home Manager

- **Neovim:** configured via nixvim, with `vi`/`vim` aliases and relative line numbers
- **Cursor:** Bibata-Modern-Classic (size 20)
- **Idle management:** swayidle — monitors off after 5 minutes
- **Shell aliases:** `btw`, `nixos` (rebuild switch), `ls` → `lsd`

## Waybar

`config/` holds a Waybar config and stylesheet using the **Tokyo Night** color palette. Modules: workspaces, active window, network, CPU, memory, disk, clock, tray.

## Why NixOS

- **Reproducibility** — the entire system is defined in one place. Any machine built from this flake will be identical.
- **Atomic upgrades and rollbacks** — switching to a new config is a single command, and rolling back is just as easy if something breaks.
- **Declarative package management** — no leftover files, no dependency conflicts. Packages are installed and removed cleanly.
- **Flakes** — pinned inputs mean the system can be rebuilt exactly as-is months or years later without hunting down the right package versions.
- **Home Manager** — user-level config (shell, editor, cursor, idle daemon) is managed the same way as the system, so nothing is left to manual setup.

## Upcoming

- **Pentest flake** — a separate NixOS configuration tailored for red team work, with offensive security tooling and a distinct color scheme to make it immediately obvious which environment you're in. Still in the early planning stages.

## Usage

```bash
# Build and switch
sudo nixos-rebuild switch --flake .#ganymede

# Or with the shell alias
nixos

# Update inputs
nix flake update
```
