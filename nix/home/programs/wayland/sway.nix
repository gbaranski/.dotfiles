{ pkgs, lib, ... }:
{
  services.kanshi = {
    enable = true;
    profiles = {
      mobile = {
        outputs = [
        {
          criteria = "eDP-1";
          status = "enable";
          mode = "1920x1080@60Hz";
          position = "0,0";
          scale = 1.1;
        }
        ];
      };
      docked = {
        outputs = [
        {
          criteria = "eDP-1";
          status = "disable";
        }
        {
          criteria = "DP-1";
          status = "enable";
          mode = "1920x1080@60Hz";
          position = "0,0";
        }
        ];
      };
    };
  };
  /* programs.firefox = { */
  /*   enable = false; */
  /*   package = pkgs.wrapFirefox pkgs.firefox-unwrapped { */
  /*     forceWayland = true; */
  /*     extraPolicies = { */
  /*       ExtensionSettings = {}; */
  /*     }; */
  /*   }; */
  /* }; */

  programs.i3status-rust = {
    enable = true;
    bars = {
      default = {
        blocks = [
          {
            block = "cpu";
            interval = 1;
            format = "{barchart} {utilization} {frequency}";
          }
          {
            block = "memory";
            format_mem = "{Mum}MiB";
            display_type = "memory";
          }
          {
            block = "net";
            device = "wlan0";
            interval = 5;
            format = "{ssid} {ip}";
          }
          {
            block = "sound";
            format = "{volume}";
            driver = "pulseaudio";
          }
          {
            block = "temperature";
            interval = 5;
            collapsed = false;
            good = 45;
            idle = 60;
            info = 70;
            warning = 90;
            format = "{max}°C";
          }
          {
            block = "time";
            interval = 60;
            format = "%a %d/%m %R";
          }
        ];
        settings = {
          theme =  {
            name = "modern";
            overrides = {
              critical_bg = "#E06C75B2";
              critical_fg = "#282C34";

              warning_bg  = "#282C34B2";
              warning_fg  = "#E06C75";

              info_bg     = "#282C34B2";
              info_fg     = "#E06C75";

              idle_bg     = "#282C34B2";
              idle_fg     = "#ABB2BF";

              good_bg     = "#282C34B2";
              good_fg     = "#61AFEF";

              separator    = "";
            };
          };
        };
        icons = "awesome5";
        theme = "modern";
      };
    };
  };
  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = 1;
    XDG_CURRENT_DESKTOP = "sway"; 
  };
  home.file.".wallpaper".source = ../wallpaper.jpg;
  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    xwayland = true;
    systemdIntegration = false;
    config = {
      colors = {
        # Color #FFFFFF means that i don't know het what i does
        focused = { 
          background  = "#61AFEF"; 
          border      = "#FFFFFF"; 
          text        = "#FFFFFF"; 
          childBorder = ""; 
          indicator   = ""; 
        };
        focusedInactive = { 
          background  = "#282C34"; 
          border      = "#FFFFFF"; 
          text        = "#FFFFFF"; 
          childBorder = ""; 
          indicator   = ""; 
        };
        unfocused = { 
          background  = "#282C34"; 
          border      = "#FFFFFF"; 
          text        = "#FFFFFF"; 
          childBorder = ""; 
          indicator   = ""; 
        };
        urgent = { 
          background  = "#E06C75"; 
          border      = "#FFFFFF"; 
          text        = "#FFFFFF"; 
          childBorder = ""; 
          indicator   = ""; 
        };
      };
      gaps = {
        smartBorders = "on";
        smartGaps = true;
        inner = 10;
      };
      bars = [
        {
          extraConfig = ''
            status_command i3status-rs ~/.config/i3status-rust/config-default.toml
            height 26
            '';
          position = "top";
          fonts = [ "FiraCode Nerd Font" "Font Awesome 5 Free" ];
          colors = {
            separator   = "#ABB2BF";
            background  = "#282C34B2";
            statusline  = "#dddddd";
          };
        }
      ];
      modifier = "Mod4";
      output = {
        "*" = {
          bg = "~/.wallpaper fill";
        };
      };
      terminal = "alacritty";
      startup = [
        {
          command = "mako";
        }
        {
          command = "kanshi";
          always = true;
        }
      ];
      menu = ''
        j4-dmenu-desktop         \
        --dmenu='bemenu          \
        -H 26                    \
        -p run                   \
        -i                       \
        --ifne                   \
        --fn "Jetbrains Mono 10" \
        --tb "#282C34"           \
        --tf "#ABB2BF"           \
        --fb "#282C34"           \
        --ff "#61AFEF"           \
        --nb "#282C34"           \
        --nf "#61AFEF"           \
        --hb "#61AFEF"           \
        --hf "#282C34"'          \
        --term='alacritty'
      '';
      keybindings = lib.mkOptionDefault {
        XF86AudioRaiseVolume  = "exec pamixer -ui 2";
        XF86AudioLowerVolume  = "exec pamixer -ud 2";
        XF86AudioMute         = "exec pamixer --toggle-mute";
        XF86MonBrightnessUp   = "exec light -A 5";
        XF86MonBrightnessDown = "exec light -U 5";
        XF86AudioPlay         = "exec playerctl play-pause";
        XF86AudioNext         = "exec playerctl next";
        XF86AudioPrev         = "exec playerctl previous";

        "--release Print       " = "exec grimshot copy area";
        "--release Shift+Print " = "exec grimshot save area ~/screenshots/$(date +%F_%H-%M-%S).png";
      };
      input = {
        "type:touchpad" = {
          tap = "enabled";
          drag = "disabled";
        };
        "type:keyboard" = {
          xkb_layout = "pl";
          xkb_options = "ctrl:nocaps";
        };
      };
    };
  };
  home.packages = with pkgs; [
    xorg.xeyes   # For testing if app runs via xwayland
    swaylock     # Screen lock
    swayidle     # Screen idle
    wl-clipboard # Clipboard
    waybar       # Bar
    wf-recorder  # Recording
    mako         # Notifications
    j4-dmenu-desktop # Faster way to execute bemenu, only with desktop apps
    bemenu       # App launcher
    flameshot    # Screenshooting
    grim         # Screenshooting
    swappy       # Screenshot editing
    slurp        # Capturing size of screenshot
    kanshi       # Monitors

    sway-contrib.grimshot # For taking screenshots
    xdg-desktop-portal # xdg-desktop-portal backend
    xdg-desktop-portal-wlr # xdg-desktop-portal backend for wlroots
  ];
}
