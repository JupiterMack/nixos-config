{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    wofi
    ranger
    swww
    wireplumber
    brightnessctl
    playerctl
    zoxide
    hyprlock
    pywal16
    libnotify
    hyprcursor
    bibata-cursors
    inputs.zen-browser.packages."${pkgs.system}".twilight
    wayland
    compose2nix
    zed-editor
  ];
}
