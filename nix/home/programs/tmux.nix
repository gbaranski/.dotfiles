{ ... }:
{
  programs.tmux = {
    enable = true;
    clock24 = true;
    escapeTime = 0;
    keyMode = "vi";
    terminal = "screen-256color";
    baseIndex = 1;
    shortcut = "a";
    customPaneNavigationAndResize = true;
    extraConfig = 
      ''
      set -g mouse on
      set -g default-shell ~/.nix-profile/bin/fish
      # Create Panes: window splitting
      # Split vertically
      unbind %
      bind | split-window -h    # Prefix | to create vertical split
      # Split horizontally
      unbind '"'
      bind - split-window -v    # Prefix - to create horizontal split
      '';
  };
}