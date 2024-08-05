{ pkgs, ... }: {
  name = "bomboclaat ags nix modules";

  languages = { };

  packages = [
    pkgs.ags
  ];

  pre-commit = {
    settings = { };
    hooks = { nixpkgs-fmt.enable = true; };
  };

  enterShell = ''
    echo 'Biep Boop'
  '';
}