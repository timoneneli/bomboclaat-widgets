{ pkgs, inputs, lib, config, ... }: {
  imports = [ inputs.ags.homeManagerModules.default ];

  options = {
    bomboclaat = {
      enable = lib.mkEnableOption "Enable Bomboclaat";
      eli = lib.mkEnableOption "Timon of Eli?????";
    };
  };

  config = lib.mkIf config.bomboclaat.enable {
    programs.ags = {
      enable = lib.mkDefault true;

      configDir = ../ags-widgets;

      extraPackages = with pkgs; [
        gtksourceview
        webkitgtk
        accountsservice
      ];
    };

  };

}
