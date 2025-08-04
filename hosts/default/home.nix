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
    ../../modules/home-manager/starship/starship.nix
    ../../modules/home-manager/nvf-custom.nix
    inputs.zen-browser.homeModules.twilight
    inputs.nvf.homeManagerModules.default
  ];
  programs.nvf = {
    enable = true;

 };
 
  programs.zen-browser.enable = true;

  programs.git = {
    enable = true;
    userName = "JupiterMack";
    userEmail = "mackjupiter@gmail.com";
    extraConfig = {
      safe.directory = "/etc/nixos";
    };
  };
  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";  # A clean, dark theme; change if preferred
      package = pkgs.gnome-themes-extra;
    };
    iconTheme = {
      name = "Papirus";  # Popular icon set; alternatives like "Adwaita" or "gnome"
      package = pkgs.papirus-icon-theme;
    };
  };

  home.stateVersion = "25.05";

  home.file.".config/hypr/scripts/theme-switch.sh" = {
    source = ./theme-switch.sh;
    executable = true;
  };

  services.mako = {
    enable = true;
    settings = {
      default-timeout = 5000;  # Was defaultTimeout
      border-radius = 5;       # Was borderRadius
      border-size = 2;         # Was borderSize
      background-color = "#1e1e2e";  # Was backgroundColor
      text-color = "#cdd6f4";  # Was textColor
    };
  };


  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
