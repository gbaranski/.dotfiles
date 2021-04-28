{ ... }:
{
  programs.waybar = {
    enable = true;
    style = builtins.readFile ./waybar_style.css;
    settings = [
      {
        layer = "top";
        position = "top";
        height = 32;
        modules-left = ["sway/workspaces" "sway/mode" "wlr/taskbar"];
        modules-right = ["pulseaudio" "network" "cpu" "temperature" "memory" "battery" "clock"];
        modules = {
          "sway/mode" = {
            format = " {}";
          };
          "sway/workspaces" = {
            format = "{name}";
            all-outputs = true;
          };
          "clock" = {
            format = "{:%a %d %b %H:%M}";
            tooltip = false;
          };
          "battery" = {
            format-icons = ["" "" "" "" ""];
            format = "CHR {capacity}% {icon}";
            format-discharging = "BAT {capacity}% {icon}";
            format-alt = "{time} {icon}";
            interval = 30;
            states = {
              warning = 40;
              critical = 20;
            };
            tooltip = true;
          };
          "network" = {
            format = "{ipaddr} {icon}";
            format-wifi = "{essid} {icon}";
            format-disconnected = "No internet {icon}";
            format-icons = {
              wifi = [ "" ];
              ethernet = [ "" ];
              disconnected = [ "睊" ];
            };
            tooltip = true;
            tooltip-format-wifi = "{ifname} - {ipaddr}/{cidr} - {signalStrength}% - {frequency}MHz";
          };
          "pulseaudio" = {
            format = "{icon}";
            format-bluetooth = "{volume}% {icon}";
            format-muted = "婢";
            format-icons = {
              headphone = "";
              headset = "";
              default = ["" "" "墳" ""];
            };
            scroll-step = 10;
            on-click = "alacritty -e pulsemixer";
            tooltip = true;
          };
          "cpu" = {
            format = "{usage}% ";
            interval = 1;
            states = {
              warning = 30;
              critical = 60;
            };
          };
          "temperature" = {
            thermal-zone = 5;
            critical-threshold = 80;
            format = "{temperatureC}C ";
          };
          "memory" = {
            format = "{used:0.1f}G/{total:0.1f}G ";
          };
        };
      }
    ];
  };

}
