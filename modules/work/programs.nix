{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    clickup
    figma-linux
    pgadmin4-desktopmode
  ];

  programs.thunderbird.enable = true;
}
