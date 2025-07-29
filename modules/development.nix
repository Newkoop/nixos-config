{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    python3
    vscode-fhs
    texlive.combined.scheme-medium
    docker
    nixfmt-rfc-style
  ];

  virtualisation.docker.enable = true;
  users.users.maikel.extraGroups = [ "docker" ];

  services.tailscale.enable = true;
}
