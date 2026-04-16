{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    # Packages with custom configs
    ./alacritty.nix
    ./git.nix
    ./lazygit.nix # Terminal-based git GUI
    # ./nixvim # neovim configured through nix
    ./fonts.nix
    ./fish.nix # Shell
    ./starship # Shell prompt
    ./zoxide.nix # cd replacement
    ./eza.nix # ls replacement
    ./btop.nix # fancy htop
    ./bat.nix # cat replacement
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
      username = lib.mkDefault "finnolavsagen";
      homeDirectory = lib.mkDefault "/Users/${config.home.username}";
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
        fzf # Fuzzy find
        delta # Diff pager for git
        ripgrep # grep goodness
        fastfetch # System info
        fd # find replacement
        zip
        unzip
        xsel
        ;
    };
  };
}
