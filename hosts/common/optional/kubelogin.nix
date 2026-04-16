{ pkgs, ... }:
{
  home.packages = [
    pkgs.kubelogin-oidc
    pkgs.krew
  ];
}
