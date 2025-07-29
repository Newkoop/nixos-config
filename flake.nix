{
  description = "NixOS config for maikel@nixos";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    inputs.sentinelone.url = "github:devusb/sentinelone-nix";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      musnix,
      ...
    }:
    {
      #work
      nixosConfigurations.work = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/work/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.maikel = import ./home/default.nix;
          }
        ];
      };
    };
}
