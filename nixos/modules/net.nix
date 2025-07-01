{
  networking.networkmanager.enable = true;
  networking.firewall = {
	allowedTCPPorts = [ 22 ];
	# allowedUDPPorts = [];
  };
}
