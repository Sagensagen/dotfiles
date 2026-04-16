{ inputs,pkgs,config, ... }:
{
  imports = [
    ################ Required ################
    common/core

    ################ Extras passed from flake ################
    inputs.nixvim.homeManagerModules.nixvim
    inputs.nix-colors.homeManagerModules.default
    inputs.stylix.homeManagerModules.stylix

    ################ Optionals ################
    common/optional/openfortivpn.nix
    common/optional/kubernetes.nix
    common/optional/k9s.nix
    common/optional/talosctl.nix
    common/optional/azure-cli.nix
    common/optional/terraform.nix
    common/optional/kubelogin.nix
    common/optional/opentofu.nix
    common/optional/tilt.nix
    common/optional/yq.nix
    common/optional/pandoc.nix
    common/optional/psql.nix
    common/optional/rclone.nix
    common/optional/div.nix
    common/optional/claude.nix
    common/optional/openshift.nix
  ];

  # Custom options
  laptop.enable = true;
}
