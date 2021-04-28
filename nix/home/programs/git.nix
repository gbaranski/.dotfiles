{ ... }:
{
  programs.git = {
    enable = true;
    userName = "gbaranski";
    userEmail = "root@gbaranski.com";
    aliases = {
      sla = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --";
    };
  };
}
