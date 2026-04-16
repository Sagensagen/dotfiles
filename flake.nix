{
  description = "Home manager config for Finn Olav";

  inputs = {

    ############### Official nixos/hm sources ###############

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    
    home-manager = {
      url = "github:nix-community/home-manager/master"; # master follows unstable
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ############### External sources  ###############

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-colors.url = "github:misterio77/nix-colors";

    stylix.url = "github:danth/stylix";
  };

  outputs =
    { nixpkgs, home-manager, ... }@inputs:
    let
      system = "aarch64-darwin";
     # pkgs = nixpkgs.legacyPackages.${system};

      pkgs = import nixpkgs {
              inherit system;
              config = {
                allowUnfree = true;
                # Optional: specifically allow just claude-code if you want to be strict
                # allowUnfreePredicate = pkg: builtins.elem (nixpkgs.lib.getName pkg) [ "claude-code" ];
              };
            };
      
    in
    {
      # Dell laptop
      homeConfigurations."finnolavsagen@m3" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        extraSpecialArgs = {
          inherit inputs;
        };

        modules = [ ./hosts/m3.nix ];
      };
      # Old work machine
      homeConfigurations."ole@donkeykong" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        extraSpecialArgs = {
          inherit inputs;
        };

        modules = [ ./hosts/donkeykong.nix ];
      };
      # New work machine
      homeConfigurations."ole@jzargo" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        extraSpecialArgs = {
          inherit inputs;
        };

        modules = [ ./hosts/jzargo.nix ];
      };
      # Ekman server
      homeConfigurations."oty@ekman" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        extraSpecialArgs = {
          inherit inputs;
        };

        modules = [ ./hosts/ekman.nix ];
      };
    };
}
