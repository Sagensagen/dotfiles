{ lib, ... }:
{
  options.identity = {
    name = lib.mkOption { type = lib.types.str; description = "Full name for git commits"; };
    email = lib.mkOption { type = lib.types.str; description = "Email for git commits"; };
    signingKey = lib.mkOption {
      type = lib.types.str;
      default = "~/.ssh/id_ed25519.pub";
      description = "Path to SSH public key used for commit signing";
    };
  };

  config.identity = {
    name = "Finn Olav Sagen";
    email = "fo-sagen@drsagen.no";
  };
}
