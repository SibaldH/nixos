{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [ glibcLocales ];

  i18n = {
    extraLocales = "all";
    defaultLocale = "en_BE.UTF-8";
    extraLocaleSettings = {
      LANGUAGE = "en_BE.UTF-8";
      LANG = "en_BE.UTF-8";
      LC_TIME = "en_BE.UTF-8";
      LC_NUMERIC = "en_BE.UTF-8";
      LC_COLLATE = "en_BE.UTF-8";
      LC_IDENTIFICATION = "en_BE.UTF-8";
      LC_MONETARY = "en_BE.UTF-8";
      LC_PAPER = "en_BE.UTF-8";
      LC_ADDRESS = "en_BE.UTF-8";
      LC_TELEPHONE = "en_BE.UTF-8";
      LC_MEASUREMENT = "en_BE.UTF-8";
      LC_NAME = "en_BE.UTF-8";
      LC_CTYPE = "en_BE.UTF-8";
      LC_MESSAGES = "en_BE.UTF-8";
    };
  };
}
