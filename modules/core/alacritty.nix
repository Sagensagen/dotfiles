{ pkgs, lib, ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      window.opacity = lib.mkForce 0.85;
    };

    # Font configuration

    # Optional: shell to launch
    # shell = pkgs.fish;
  };
}
