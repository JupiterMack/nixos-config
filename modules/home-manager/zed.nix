{ pkgs, ... }:

{
  programs.zed-editor = {
    enable = true;

    # Basic user settings (written to ~/.config/zed/settings.json)
    # Customize as needed; this is a starting point to disable telemetry, set font sizes, and use system theme mode.
    userSettings = {
      telemetry = {
        diagnostics = false;
        metrics = false;
      };
      ui_font_size = 16;
      buffer_font_size = 15;
      theme = {
        mode = "system";  # Follows your system light/dark mode (useful with Hyprland)
        light = "One Light";
        dark = "One Dark";
      };
      # Add more settings here, e.g.:
      # autosave = "on_focus_change";
      # tab_size = 4;
      # vim_mode = true;  # If you want Vim keybindings
    };

    # Optional: Custom keymap (written to ~/.config/zed/keymap.json)
    # Example: Add or override bindings
    keymap = [
      {
        context = "Editor";
        bindings = {
          "ctrl-shift-l" = "editor::Format";
        };
      }
    ];

    # Optional: Install extensions on startup (from Zed's extension marketplace)
    # Example: Add language support or tools
    extensions = [
      "nix"  # For Nix language support
      "rust" # If you code in Rust
      "git"  # Enhanced Git integration
    ];

    # Optional: Extra packages made available to Zed (e.g., for language servers or tools)
    extraPackages = with pkgs; [
      nil  # Nix language server
      rust-analyzer  # For Rust
    ];
  };

  # Optional: Set Zed as your default editor (e.g., for git commit or terminal editing)
  # If you don't want this, comment it out.
  home.sessionVariables.EDITOR = "zed";
}
