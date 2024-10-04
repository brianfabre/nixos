{
  config,
  pkgs,
  lib,
  ...
}: {
  nixpkgs.overlays = [
    (final: prev: {
      dwl = prev.dwl.overrideAttrs (old: {
        src = ./../../../source/dwl;
        postPatch = let
          configFile = ./config.def.h;
        in ''
          cp ${configFile} config.def.h
        '';
      });
    })
  ];

  # Enable Display Manager
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --remember --time --time-format '%I:%M %p | %a • %h | %F' --cmd 'dwl > /home/brian/.cache/dwl_info'";
        user = "greeter";
      };
    };
  };

  # UNTESTED, uncomment when using dwl
  # environment.systemPackages = with pkgs; [
  #   dwl
  # ];
}
