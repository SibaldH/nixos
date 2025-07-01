{ pkgs, user, ... }: {
  users = {
    users.${user} = {
      isNormalUser = true;
      shell = pkgs.nushell;
      extraGroups = [ "wheel" "networkmanager" ];
    };
  };

  services.getty.autologinUser = user;
}
