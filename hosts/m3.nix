{ inputs, pkgs, ... }:
{
  imports = [
    ../modules/core
    inputs.nixvim.homeModules.nixvim
    inputs.nix-colors.homeManagerModules.default
    inputs.stylix.homeModules.stylix
  ];

  home.username = "finnolavsagen";
  home.homeDirectory = "/Users/finnolavsagen";
  laptop.enable = true;

  # CLI packages — add/remove as needed
  home.packages = with pkgs; [
    claude-code
    docker
    k9s
    kubectl
    kubernetes-helm
    kubelogin
    kubelogin-oidc
    openfortivpn
    openshift
    opentofu
    pandoc
    postgresql
    rclone
    talosctl
    terraform
    tilt
    yq-go
  ];
}
