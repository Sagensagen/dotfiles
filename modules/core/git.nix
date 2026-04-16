{ config, ... }:
{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = config.identity.name;
        email = config.identity.email;
        signingkey = config.identity.signingKey;
      };

      commit = {
        gpgsign = true;
      };

      gpg = {
        format = "ssh";
        ssh = {
          allowedsignersfile = "~/.ssh/allowed_signers";
        };
      };
    };
  };
}
