{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];

  services.fstrim.enable = lib.mkDefault true;
}
