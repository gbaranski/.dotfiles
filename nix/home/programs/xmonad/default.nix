{ pkgs, ... }:
{
  home.packages = with pkgs; [
    xmobar           # Bar
    dunst            # Notifications
    flameshot        # Screenshoting
    feh              # Background
    dmenu            # Launching apps
    j4-dmenu-desktop # Faster launching dmenu and viewing .desktop files
  ];
  home.file.".xmobarrc".source = ./xmobar.hs;
  home.file.".wallpaper.jpg".source = ../wallpaper.jpg;
  xsession = {
    enable = true;
    scriptPath = ".xinitrc";
    initExtra = 
      ''
      if test -z "$DBUS_SESSION_BUS_ADDRESS"; then
        eval $(dbus-launch --exit-with-session --sh-syntax)
      fi
      systemctl --user import-environment DISPLAY XAUTHORITY

      if command -v dbus-update-activation-environment >/dev/null 2>&1; then
              dbus-update-activation-environment DISPLAY XAUTHORITY
      fi

      autorandr --change
      feh --bg-fill ~/.wallpaper.jpg
      '';
    /* profileExtra = ''export $(dbus-launch)''; */
    windowManager.xmonad = {
      enable = true;
      config = ./xmonad.hs;
      extraPackages = p: with p; [
        xmonad
	      xmonad-contrib
	      dbus
      ];
    };
  };
}
