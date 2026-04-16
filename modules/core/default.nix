{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ../../user.nix
    ./alacritty.nix
    ./git.nix
    ./lazygit.nix
    ./fonts.nix
    ./fish.nix
    ./starship
    ./eza.nix
    ./btop.nix
    ./bat.nix
    ./direnv.nix
    ./helix.nix
  ];

  # Custom options
  options = {
    laptop.enable = lib.mkEnableOption "Enable laptop-specific features";
  };

  config = {

    laptop.enable = lib.mkDefault false;

    # Let home manager install and manage itself
    programs.home-manager.enable = true;

    # Home manager configuration
    home = {
      stateVersion = lib.mkDefault "23.11";
      sessionVariables = {
        SHELL = "fish";
        EDITOR = "hx";
      };
    };

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # Packages without custom configs
    home.packages = builtins.attrValues {
      inherit (pkgs)
        fsautocomplete
        fzf
        jq
        delta
        ripgrep
        fastfetch
        fd
        zip
        unzip
        xsel
        ;
    };
  };
}
