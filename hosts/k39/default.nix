{
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];

  # FIXME: temp fix "sudo -E input-remapper-gtk" to access GUI
  services.input-remapper.enable = true;

  # HACK: autoload doesn't work for non-DE env
  # https://github.com/sezanzeb/input-remapper/issues/653
  systemd.user.services.autoload-input-remapper = {
    description = "Load the input-remapper config";
    wantedBy = ["default.target"];
    path = [pkgs.input-remapper];
    script = ''
      input-remapper-control --command autoload
    '';
  };
}
