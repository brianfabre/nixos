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
}
