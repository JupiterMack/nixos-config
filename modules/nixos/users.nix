{ pkgs, ... }:

{
  users.users.jupi = {
    isNormalUser = true;
    description = "jupi";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;  # Sets fish as the default login shell for the user
  };

  programs.fish.enable = true;  # Enables system-wide fish support (e.g., vendor completions)
}
