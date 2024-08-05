{
  inputs = {
    nixpkgs = { url = "github:NixOS/nixpkgs/nixpkgs-unstable"; };
    devenv.url = "github:cachix/devenv/v0.6.3";

    ags.url = "github:Aylur/ags";
  };

  outputs = { self, nixpkgs, devenv, ... }@inputs:
    let
      unstable-pkgs-linux = import nixpkgs {
        system = "x86_64-linux";
      };
    in
    {
      devShell = {
        x86_64-linux = devenv.lib.mkShell {
          inputs = inputs // { nixpkgs = nixpkgs; };
          pkgs = unstable-pkgs-linux;
          modules = [ ./devenv.nix ];
        };
      };

      homeManagerModules = {
        default = self.homeManagerModules.ags;
        bomboclaat-widgets = import ./src self;
      };

      formatter = {
        x86_64-linux = unstable-pkgs-linux.nixfmt-classic;
      };
    };
}
