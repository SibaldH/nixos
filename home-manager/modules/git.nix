{
  programs.git = {
    enable = true;
    settings.user = {
      name = "SibaldH";
      email = "sibald.hulselmans@protonmail.com";
    };
    settings.alias = {
      # The most popular fancy log
      lol = "log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'";
      lola = "log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --all";

      # Even fancier version that many people love
      graph = ''
        log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)' --all
      '';

      # Ultra pretty one-liner
      pretty = ''
        log --graph --pretty=format:'%C(yellow)%h %Cblue%>(8)%ad%Creset %C(yellow)%d%Creset %s %C(red)%C(bold)<%an>%Creset' --date=short
      '';
    };
  };
}
