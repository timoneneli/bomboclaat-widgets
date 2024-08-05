{pkgs, inputs, ...}: {
  imports = [ inputs.ags.homeManagerModules.default ];

  programs.ags = {
    enable = true;

    configDir = ../ags-widgets;

    extraPackages = with pkgs; [
      gtksourceview
      webkitgtk
      accountsservice
    ];
  };

}