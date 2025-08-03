{ ... }:

{
  programs.wofi = {
    enable = true;
    settings = {
      show = "drun";
      width = 750;
      height = 400;
      always_parse_args = true;
      show_all = false;
      term = "kitty";
    };
    style = ''
      @import url("~/.cache/wal/colors.css");
      * {
        font-family: monospace;
        font-size: 14px;
      }
      #window {
        background: var(--background);
        border-radius: 10px;
      }
      #input {
        margin: 10px;
        background: var(--color1);
        color: var(--foreground);
      }
      #entry:selected {
        background: var(--color2);
        color: var(--foreground);
      }
    '';
  };
}
