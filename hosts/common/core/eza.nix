{...}:
{
  programs.eza = {
    enable = true;

    # Enable icons (requires Nerd Font)
    icons = "never";

    # Git integration
    git = true;

    # Common defaults
    extraOptions = [
      "--group-directories-first"
      "--time-style=long-iso"
      "--color=always"
    ];
  };
}
