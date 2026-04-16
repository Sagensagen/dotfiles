{ pkgs, ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      window.opacity = 0.85;      
    };

    # Font configuration

    # Optional: shell to launch
    # shell = pkgs.fish;
  };
}
