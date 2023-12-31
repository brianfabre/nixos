{ config, pkgs, inputs, ... }:
{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.brian = import ./home.nix;

  # Optionally, use home-manager.extraSpecialArgs to pass arguments to home.nix
  home-manager.extraSpecialArgs = { inherit inputs; };
}
