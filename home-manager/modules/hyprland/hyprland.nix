{ config, pkgs, inputs, ... }: {
        wayland.windowManager.hyprland = {
                enable = true;
                package = inputs.hyprland.packages.${pkgs.system}.hyprland;
                portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
                
                settings = {
                        decoration = {
                        shadow_offset = "0 5";
                        "col.shadow" = "rgba(00000099)";
                        };

                        "$mod" = "SUPER";

                        bindm = [
                                # mouse movements
                                "$mod, mouse:272, movewindow"
                                "$mod, mouse:273, resizewindow"
                                "$mod ALT, mouse:272, resizewindow"
                        ];
                };
        };
}
