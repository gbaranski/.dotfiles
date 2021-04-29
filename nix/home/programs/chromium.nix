{ pkgs, ... }:
{
  programs.chromium = {
    enable = true;
    package = pkgs.chromium.override { 
      commandLineArgs = "--enable-features=WebUIDarkMode --force-dark-mode --enable-features=UseOzonePlatform --ozone-platform=wayland"; 
    };
    extensions = [
      "cjpalhdlnbpafiamejdnhcphjbkeiagm" # uBlock Origin
      "dbepggeogbaibhgnhhndojpepiihcmeb" # Vimium
    ];
  };
}
