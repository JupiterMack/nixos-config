{ ... }:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set  fish_greeting "" 
    '';
    # Optional: Add shell aliases, functions, or plugins here
    # shellAliases = { ll = "ls -l"; };
  };
}
