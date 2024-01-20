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
      thinkpad1 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        # pass inputs to modules
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/thinkpad1
          ./modules/configuration.nix
          ./modules/dwl/notebook/dwl.nix
          ./modules/zotero.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.brian = {
              imports = [
                ./home
                ./home/thinkpad.nix
              ];
            };
            # pass arguments to home.nix
            home-manager.extraSpecialArgs = {inherit inputs;};
          }
        ];
      };

      k39 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        # pass inputs to modules
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/k39
          ./modules/configuration.nix
          ./modules/dwl/desktop/dwl.nix
          ./modules/zotero.nix
          ./modules/syncthing.nix

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

      thinkpad2 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        # pass inputs to modules
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/thinkpad2
          ./modules/configuration.nix
          ./modules/dwl/notebook/dwl.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.brian = {
              imports = [
                ./home
                ./home/thinkpad.nix
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
