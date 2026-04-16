{
  description = "Home manager config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-colors.url = "github:misterio77/nix-colors";
    stylix.url = "github:danth/stylix";
  };

  outputs = { nixpkgs, home-manager, ... }@inputs:
  let
    mkHost = { system, hostModule }:
      home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
        extraSpecialArgs = { inherit inputs; };
        modules = [ hostModule ];
      };
  in
  {
    homeConfigurations."m3" = mkHost {
      system = "aarch64-darwin";
      hostModule = ./hosts/m3.nix;
    };

    homeConfigurations."xps" = mkHost {
      system = "x86_64-linux";
      hostModule = ./hosts/xps.nix;
    };
  };
}
