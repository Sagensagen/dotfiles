{ pkgs, lib, ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      window.opacity = lib.mkForce 0.85;
    };

    settings.terminal.shell.program = "${pkgs.fish}/bin/fish";
  };
}
