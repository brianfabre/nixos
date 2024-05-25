{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nur.url = "github:nix-community/nur";
  };

  outputs = {
    nixpkgs,
    home-manager,
    ...
  } @ inputs: {
    nixosConfigurations = {

      main = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        # pass inputs to modules
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/thinkpad1
          ./modules/configuration.nix
          # ./modules/dwl/desktop/dwl.nix
          ./modules/sway.nix
          # ./modules/kde6.nix
          # ./modules/kde.nix
          # ./modules/zotero.nix
          # ./modules/syncthing.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.brian = {
              imports = [
                ./home
              ];
            };
            # pass arguments to home.nix
            home-manager.extraSpecialArgs = {inherit inputs;};
          }
        ];
      };

    };
  };
}
