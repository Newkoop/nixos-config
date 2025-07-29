{ config, pkgs, ... }:

{
  home.username = "maikel";
  home.homeDirectory = "/home/maikel";

  home.packages = with pkgs; [
    rustup
  ];

  home.stateVersion = "25.05";

  programs.home-manager.enable = true;

  dconf.settings = {
    "org/gnome/desktop/wm/keybindings" = builtins.listToAttrs (
      builtins.genList (n: {
        name = "switch-to-workspace-${toString (n + 1)}";
        value = [ "<Control><Alt>${toString (n + 1)}" ];
      }) 9
    );
  };
}
