{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    clickup
    figma-linux
    pgadmin4
  ];

  programs.thunderbird.enable = true;
}
