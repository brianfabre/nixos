{
  config,
  pkgs,
  lib,
  ...
}: {
  services.xserver.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
  services.xserver.displayManager.defaultSession = "plasmawayland";

  # Enable Display Manager
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --remember --time --time-format '%I:%M %p | %a • %h | %F' --cmd 'startplasma-wayland'";
        user = "greeter";
      };
    };
  };
}
