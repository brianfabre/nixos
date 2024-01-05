{
  config,
  pkgs,
  lib,
  ...
}: {
  environment.systemPackages = with pkgs; [
    dwl
    bemenu
    clipman
    foot
    gammastep
    grim
    slurp
    wev
    wl-clipboard
    wlr-randr
    yambar
  ];

  nixpkgs.overlays = [
    (final: prev: {
      dwl = prev.dwl.overrideAttrs (old: {
        src = ./../source/dwl;
        postPatch = let
          configFile = ./../hosts/k39/dwl/config.def.h;
        in ''
          cp ${configFile} config.def.h
        '';
      });
    })
  ];
}
