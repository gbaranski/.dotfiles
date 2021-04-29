{ config, pkgs, ... }:
let
  nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
    inherit pkgs;
  };
in
{
  home.sessionVariables.BROWSER = "firefox";
  programs.firefox = {
    enable = true;
    extensions = with nur.repos.rycee.firefox-addons; [
      vimium
      ublock-origin
      bitwarden
    ];
    package = pkgs.wrapFirefox pkgs.firefox-unwrapped {
      forceWayland = true;
      extraPolicies = {
        ExtensionSettings = {};
      };
    };
    profiles = {
      home = {
        settings = {
          "apz.gtk.kinetic_scroll.enabled" = false;
          "general.smoothScroll" = false;
          "browser.download.dir" = "${config.home.homeDirectory}/dl";
          "media.ffmpeg.vaapi.enabled" = true;
          "media.ffvpx.enabled" = false;
          "media.rdd-vpx.enabled" = false;
          "media.navigator.mediadatadecoder_vpx_enabled" = true;
        };
      };
    };
  };
}
