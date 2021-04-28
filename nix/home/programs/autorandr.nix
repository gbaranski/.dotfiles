{ ... }:
{
  programs.autorandr = {
    enable = true;
    profiles.mobile = {
      fingerprint = {
        eDP-1 = "00ffffffffffff0006af2d5b00000000001c0104a51d107803ee95a3544c99260f505400000001010101010101010101010101010101b43780a070383e403a2a350025a21000001a902c80a070383e403a2a350025a21000001a000000fe003036564736814231333348414e0000000000024122a8011100000a010a202000f0";
      };
      config = {
        eDP-1 = {
          enable = true;
          primary = true;
          position = "0x0";
          mode = "1920x1080";
          crtc = 0;
        };
        DP-1 = {
          enable = false;
        };
        DP-2 = {
          enable = false;
        };
      };
    };
    profiles.docked = {
      fingerprint = {
        eDP-1 = "00ffffffffffff0006af2d5b00000000001c0104a51d107803ee95a3544c99260f505400000001010101010101010101010101010101b43780a070383e403a2a350025a21000001a902c80a070383e403a2a350025a21000001a000000fe003036564736814231333348414e0000000000024122a8011100000a010a202000f0";
        DP-1 = "00ffffffffffff0010ac72404c4b52423015010380331d78ea6ea5a3544f9f26115054a54b00714f8180d1c001010101010101010101023a801871382d40582c4500fe1f1100001e000000ff003539444a5031425542524b4c0a000000fc0044454c4c205532333132484d0a000000fd00384c1e5311000a20202020202000c6";
      };
      config = {
        eDP-1 = {
          enable = false;
        };
        DP-1 = {
          enable = true;
          primary = true;
          position = "0x0";
          mode = "1920x1080";
          rate = "60.00";
          crtc = 0;
        };
        DP-2 = {
          enable = false;
        };
      };
    };
  };
}
