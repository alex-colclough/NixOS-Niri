# niri-dotfiles

NixOS configuration for **ganymede** — an x86_64 Intel machine running the [niri](https://github.com/YaLTeR/niri) Wayland compositor.

## Structure

```
.
├── flake.nix                 # Flake inputs and NixOS system definition
├── configuration.nix         # System-level configuration
├── hardware-configuration.nix # Auto-generated hardware config
├── home.nix                  # Home Manager user configuration
├── modules/
│   └── packages.nix          # System package list
└── config/
    ├── config.jsonc          # Waybar configuration
    └── style.css             # Waybar stylesheet (Tokyo Night theme)
```

## Flake Inputs

| Input | Source |
|---|---|
| nixpkgs | nixos-unstable |
| home-manager | nix-community/home-manager |
| niri | sodiboo/niri-flake |

## System Features

- **Compositor:** niri (Wayland), with XWayland support via `xwayland-satellite`
- **Display manager:** greetd + tuigreet
- **Audio:** PipeWire (PulseAudio compat)
- **Portals:** xdg-desktop-portal-gtk + xdg-desktop-portal-wlr
- **Virtualization:** libvirtd + virt-manager
- **Gaming:** Steam + gamemode

## Packages

| Category | Packages |
|---|---|
| Terminals | kitty, ghostty, alacritty |
| Editors | neovim (LazyVim), zed-editor, vim |
| Browser | firefox, chromium |
| Launcher | fuzzel |
| File manager | thunar |
| Communication | vesktop |
| Shell | bash + starship prompt |
| Other | fastfetch, git, wget, nmap |

## Home Manager

- **Neovim:** vim/vi aliases, relative line numbers, LazyVim plugin
- **Cursor:** Bibata-Modern-Classic (size 20)
- **Idle management:** swayidle — monitors off after 5 minutes
- **Shell alias:** `btw` → `echo i use niri btw`

## Waybar

The `config/` directory holds a Waybar bar config and stylesheet using the **Tokyo Night** color palette. Modules: workspaces, active window, network, CPU, memory, disk, clock, tray.

## Usage

```bash
# Build and switch
sudo nixos-rebuild switch --flake .#ganymede

# Update inputs
nix flake update
```
