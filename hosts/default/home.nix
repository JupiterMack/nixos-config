{ config, pkgs, inputs, ... }:

{
  home.username = "jupi";
  home.homeDirectory = "/home/jupi";

  imports = [
    ../../modules/home-manager/fish.nix
    ../../modules/home-manager/kitty.nix
    ../../modules/home-manager/hyprland.nix
    ../../modules/home-manager/packages.nix
    ../../modules/home-manager/wofi.nix
    ../../modules/home-manager/waybar.nix
    inputs.zen-browser.homeModules.twilight
  ];

  programs.zen-browser.enable = true;

  programs.git = {
    enable = true;
    userName = "JupiterMack";
    userEmail = "mackjupiter@gmail.com";
    extraConfig = {
      safe.directory = "/etc/nixos";
    };
  };

  home.stateVersion = "25.05";

  home.file.".config/hypr/scripts/theme-switch.sh" = {
    source = ./theme-switch.sh;
    executable = true;
  };


  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
  };

  home.sessionVariables = {};

  programs.home-manager.enable = true;
}
