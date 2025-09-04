{ pkgs, user, ... }: {
  users = {
    users.${user} = {
      isNormalUser = true;
      shell = pkgs.nushell;
      extraGroups = [ "wheel" "networkmanager" ];
      initialPassword = "root";
    };
  };

  services.getty.autologinUser = user;
}
