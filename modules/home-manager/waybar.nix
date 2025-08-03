{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;  /* Standard from Nixpkgs */
    systemd.enable = true;  /* Optional: For auto-restart */
    settings = {
      mainBar = {
        layer = "top";  /* Position at top */
        position = "top";
        height = 24;  /* Slimmer height */
        modules-left = [ "hyprland/workspaces" ];  /* Workspaces on left */
        modules-center = [];  /* Empty for now */
        modules-right = [ "battery" ];  /* Battery on right */
	margin-left = 18;
	margin-right = 18;
	margin-top = 5;
        "hyprland/workspaces" = {
          format = "{icon}";  /* Use icons for states */
          format-icons = {
            active = "";  /* Solid circle (will style as square) */
            occupied = "";  /* Same icon, faded via CSS */
            empty = " ";  /* Space holder for empty (invisible) */
          };
          persistent-workspaces = {
            "1" = []; "2" = []; "3" = []; "4" = []; "5" = []; "6" = []; "7" = []; "8" = []; "9" = []; "10" = [];  /* Fixed 1-10, show only occupied */
          };
          on-click = "activate";  /* Switch on click */
        };
        battery = {
          format = "{capacity}%";  /* Simple percentage */
          tooltip = false;
        };
      };
    };
    style = ''
      * {
        border: none;
        border-radius: 0;
        font-family: "JetBrains Mono";
        font-size: 12px;
        min-height: 0;
      }
      window#waybar {
        background: rgba(0,0,0,0);  /* Fully transparent */
        color: white;
	padding-left: 18px;
 	padding-right: 18px;
      }
      #workspaces button {
        padding: 0 5px;
        background: transparent;
        color: white;
        opacity: 0.3;  /* Faded for inactive occupied */
        border-radius: 3px;  /* Rounded squares */
        min-width: 12px;
        min-height: 12px;
        font-size: 16px;  /* Adjust for size */
      }
      #workspaces button.active {
        opacity: 0.3;  /* Solid for active */
        background: white;  /* Solid white "square" (with icon hidden if needed) */
        color: white;  /* Or adjust for filled look */
	border: 3px ;
      }
      #workspaces button.empty {
        opacity: 0.0;  /* Invisible for empty, holds space */
      }
      #battery {
        padding: 0 10px;
        color: white;
      }
    '';
  };
}
