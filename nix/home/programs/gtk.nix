{ pkgs, ... }:
{
  gtk = {
    enable = true;
    theme = {
      package = pkgs.gnome3.gnome_themes_standard;
      name = "Adwaita:dark";
    };
    iconTheme = {
      package = pkgs.font-awesome;
      name = "Font Awesome 5 Free";
    };
    font = {
      name = "Fira Code";
      package = pkgs.fira-code;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
  };
  home.sessionVariables.GTK_THEME = "Adwaita:dark";
}
