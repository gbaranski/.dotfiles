{ ... }:
{
  services.picom= {
    enable = true;
    experimentalBackends = true;
    vSync = true;
    extraOptions = 
      ''
      unredir-if-possible=true;
      '';
  };
}
