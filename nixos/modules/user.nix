{ pkgs, user, ... }: {
  users = {
    users.${user} = {
      isNormalUser = true;
      shell = pkgs.nushell;
      extraGroups = [ "wheel" "networkmanager" "video" "input" ];
      initialPassword = "root";
    };
  };

  services.getty.autologinUser = user;
}
