{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    brave
    discord
    util-linux
    usbutils
    pinta
    libreoffice-qt6
    hunspell
    hunspellDicts.en_US
    hunspellDicts.de_DE
    smile
    spotify
    spicetify-cli
    telegram-desktop
  ];

  hardware.xone.enable = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

  programs.ausweisapp = {
    enable = true;
    openFirewall = true;
  };

  programs.kdeconnect = {
    enable = true;
    package = pkgs.valent;
  };
}
