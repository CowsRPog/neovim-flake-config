{ 
  description = "NeoVim Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs:

  let 
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {

    homeModules = rec {
      neovim-config = ./nixos;
      default = neovim-config;
    };

  };
}
