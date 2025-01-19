{
  description = "Yash's NixOS Configuration";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # I use a standalone home manager configuration
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix";
  };

  outputs = {
    nixpkgs,
    home-manager,
    stylix,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      # Allow unfree software like the Edge Browser
      config.allowUnfree = true;
    };
  in {
    homeConfigurations."yash" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      # Specify your home configuration modules here, for example,
      # the path to your home.nix.
      modules = [
        ./nix/home.nix
        stylix.homeManagerModules.stylix
      ];

      # Optionally use extraSpecialArgs
      # to pass through arguments to home.nix
    };
    nixosConfigurations.nix = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        # Import the previous configuration.nix we used,
        # so the old configuration file still takes effect
        ./nix/configuration.nix
      ];
    };
  };
}
