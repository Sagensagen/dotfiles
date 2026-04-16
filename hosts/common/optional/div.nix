{ pkgs, ... }:
{
  home.packages = [ pkgs.postgresql16Packages.pgrouting ];
}
