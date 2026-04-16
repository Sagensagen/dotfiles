{ inputs, pkgs, ... }:
{
  imports = [
    ../modules/core
    inputs.nixvim.homeModules.nixvim
    inputs.nix-colors.homeManagerModules.default
    inputs.stylix.homeModules.stylix
    ../modules/stylix.nix
    ../modules/vscode.nix
    ../modules/desktop/sway
  ];

  home.username = "finnolavsagen";
  home.homeDirectory = "/home/finnolavsagen";
  laptop.enable = true;

  # CLI + GUI packages — add/remove as needed
  home.packages = with pkgs; [
    # CLI
    docker
    k9s
    kubectl
    kubernetes-helm
    openfortivpn
    postgresql

    # GUI (NixOS only — on macOS install these manually)
    bambu-studio
    discord
    evince
    ferdium
    jetbrains.rider
    obsidian
    spotify
    yazi
  ];
}
