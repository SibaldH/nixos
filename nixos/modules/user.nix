{ pkgs, user, ... }: {
  users = {
    users.${user} = {
      isNormalUser = true;
      shell = pkgs.nushell;
      extraGroups = [ "wheel" "networkmanager" "video" ];
      initialPassword = "root";
    };
  };

  services.getty.autologinUser = user;
}
