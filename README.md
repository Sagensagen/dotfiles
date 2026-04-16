# Dotfiles

Home Manager configuration managed with Nix flakes. Modular structure with shared core modules and per-host package lists.

## Structure

```
flake.nix          # Entry point — defines hosts
user.nix           # Your identity (name, email, signing key)
hosts/
  <host>.nix       # Per-machine config + packages
modules/
  core/            # Shared across all hosts (shell, editor, git, etc.)
  stylix.nix       # Theming
  vscode.nix       # VSCode + extensions
  desktop/sway/    # Sway window manager stack
```

## Fork and personalize

1. Fork this repo
2. Edit `user.nix` with your name, email, and SSH signing key
3. Add or modify a host file in `hosts/` for your machine
4. Register the host in `flake.nix` with the correct `system` architecture

## Initial setup

Install Nix, then bootstrap with home-manager in a temporary shell:

```sh
git clone <your-fork> ~/dotfiles
cd ~/dotfiles
nix-shell -p home-manager
home-manager switch --flake .#<host> -b backup
```

After the first switch, home-manager manages itself — no need for `nix-shell` again.

## Rebuild / switch

After making changes, apply them:

```sh
home-manager switch --flake .#<host>
```

Use `build` instead of `switch` to test without activating:

```sh
home-manager build --flake .#<host>
```

## Update inputs

Update all flake inputs (nixpkgs, home-manager, etc.):

```sh
nix flake update
```

Update a single input:

```sh
nix flake update nixpkgs
```

Then rebuild to apply the updates.
