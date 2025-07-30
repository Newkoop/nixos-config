{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    clickup
  ];

  programs.thunderbird.enable = true;
}
