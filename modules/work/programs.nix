{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    clickup
    figma-linux
  ];

  programs.thunderbird.enable = true;
}
