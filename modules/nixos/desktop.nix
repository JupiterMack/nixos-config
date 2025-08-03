{ ... }:

{
  services.xserver.enable = true;

  services.displayManager = {
    sddm.enable = true;
    sddm.wayland.enable = true;
    defaultSession = "hyprland";
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";  # For Wayland compatibility
  };
}
