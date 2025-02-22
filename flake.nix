{
  description = "Angular 16 development environment";

  # Specify the Nixpkgs version
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";  # Change this to your preferred version of Nixpkgs
  };

  # Outputs define how this flake is built and used
  outputs = inputs@{ self, nixpkgs, ... }: let
    system = "x86_64-linux";
  in
  {
    devShells."${system}".default = let
      pkgs = import nixpkgs {
        inherit system;
      };
    in pkgs.mkShell {
      packages = with pkgs; [
        alejandra
        dprint
        lua-language-server
        marksman
        nil
        prettierd
        stylua
        vscode-langservers-extracted
      ];
    };
  };
}
