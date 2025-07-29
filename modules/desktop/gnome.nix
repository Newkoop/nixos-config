{ config, pkgs, ... }:

{
  services.xserver.enable = true;
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  environment.gnome.excludePackages = (
    with pkgs;
    [
      gnome-photos
      gnome-tour
      cheese
      gnome-music
    ]
  );
  programs.dconf.enable = true;
  environment.systemPackages = with pkgs; [
    gnome-tweaks
    dconf-editor
  ];

  programs.dconf.profiles.user.databases = [
    {
      settings = {
        "org/gnome/terminal/legacy/profiles:" = {
          "default" = "b1dcc9dd-5262-4d8d-a863-c897e6d979b9";
          "list" = [ "b1dcc9dd-5262-4d8d-a863-c897e6d979b9" ];
        };
        "org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9" = {
          "use-system-font" = false;
          "font" = "JetBrainsMono Nerd Font 11";
          "visible-name" = "Default";
        };
      };
    }
  ];
}
