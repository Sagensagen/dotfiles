{ ... }:
{
  programs.git = {
    enable = true;
    
    # In .NET 26.05/Home Manager unstable, all git config 
    # now lives under the 'settings' attribute.
    settings = {
      user = {
        name = "Finn Olav Sagen";
        email = "fo-sagen@drsagen.no";
        signingkey = "~/.ssh/id_ed25519.pub";
      };
      
      commit = {
        gpgsign = true;
      };
      
      gpg = {
        format = "ssh";
        ssh = {
          # Note: dots in keys (like allowed_signers) are handled 
          # by Nix as nested sets or quoted strings.
          allowedsignersfile = "~/.ssh/allowed_signers";
        };
      };
    };
  };
}
