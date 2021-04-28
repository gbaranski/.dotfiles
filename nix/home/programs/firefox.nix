{ pkgs, ... }:
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
        };
      };
    };
  };
}
