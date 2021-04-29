{ pkgs, ... }:
{
  gtk = {
    enable = true;
    theme = {
      package = pkgs.gnome3.gnome_themes_standard;
      name = "Adwaita:dark";
    };
    /* font = { */
    /*   name = "DejaVu Sans"; */
    /*   package = pkgs.dejavu_fonts; */
    /* }; */
    iconTheme = {
      package = pkgs.font-awesome;
      name = "Font Awesome 5 Free";
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
  };
  home.sessionVariables.GTK_THEME = "Adwaita:dark";
}
