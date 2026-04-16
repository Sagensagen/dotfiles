{ ... }:
{
  programs.fish = {
    enable = true;
    shellAliases = {
      l = "eza -l";
      ll = "eza -al";
      lg = "lazygit";
      cat = "bat";
      tree = "eza -T";
      fetch = "fastfetch";
      vim = "nvim";
      k = "kubectl";
    };

    shellAbbrs = {
      hms = "home-manager switch --flake ~/dotfiles";
      kcd = "kubectl config set-context --current --namespace";
    };

    interactiveShellInit = ''
      set fish_greeting
      set fish_color_param blue
    '';
  };
}
