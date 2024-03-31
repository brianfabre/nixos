{
  config,
  pkgs,
  lib,
  ...
}: {
  services.xserver.desktopManager.plasma6.enable = true;

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
