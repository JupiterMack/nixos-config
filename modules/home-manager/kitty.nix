{ ... }:

{
  programs.kitty = {
    enable = true;
    settings = {
      font_family = "jetbrains-mono";
      font_size = 12;
      background_opacity = "0.7";
      cursor_trail = 1;
      window_padding_width = 10;
    };
    extraConfig = ''
      include ~/.cache/wal/colors-kitty.conf
      background_opacity 0.7
    '';
  };
}
