{lib, ...}: {
  imports = [
    ./hardware-configuration.nix
  ];

  # FIXME: temp fix "sudo -E input-remapper-gtk"
  services.input-remapper.enable = true;
}
