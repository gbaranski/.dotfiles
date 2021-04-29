{ pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    htop             # System monitoring
    neofetch         # System stats
    keepassxc        # Password manager
    lsd              # Better `ls`
    playerctl        # Play/pause/next/previous song
    light            # Backlight control
    pamixer          # Volume up/down
    python           # Decent calculator
    libsmbios        # Managing temperature
    lm_sensors       # Managing different sensors
    ncspot           # Spotify in CLI
    signal-desktop   # Messaging app
    unzip            # Extracting things
    fzf              # Fuzzy search
    obs-studio       # For recording
    gnupg            # GPG
    github-cli       # Github CLI
    rust-analyzer    # Rust LSP
    tmux             # Terminal multiplexer
    bottom           # Better system monitoring
    appimage-run     # Running app images
    killall          # Killing programs
    pulsemixer       # Volume mixer
    tokei            # Calculating lines of code
    element-desktop  # Matrix client
    procs            # Viewing processes
    libnotify        # Notify-send cmd
    python39         # Fucking shit
    ripgrep          # Better grep
    fd               # Better find
    bitwarden        # Password manager
    bitwarden-cli    # Password manager in CLI

    # Bat is better cat, also it provides few extras
    bat              
    bat-extras.batdiff
    bat-extras.batgrep
    bat-extras.batman
    bat-extras.batwatch


    # Fonts
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    font-awesome
    fira-code
    hack-font
    fira-code-symbols
    jetbrains-mono
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];

  imports = [
    # ./programs/xmonad/default.nix
    # ./programs/autorandr.nix
    # ./programs/picom.nix
    # ./programs/dunst.nix
    ./programs/chromium.nix

    ./programs/wayland/sway.nix
    ./programs/wayland/waybar.nix

    ./programs/neovim/default.nix
    ./programs/kakoune
    ./programs/alacritty.nix
    ./programs/fish.nix
    ./programs/git.nix
    ./programs/tmux.nix
    ./programs/ncspot.nix
    ./programs/firefox.nix
    ./programs/zoxide.nix
    ./programs/gtk.nix
    ./programs/qt.nix
  ];



  home.sessionVariables = {
    PAGER = "bat";
  };
  
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "gbaranski";
  home.homeDirectory = "/home/gbaranski";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.05";
}
