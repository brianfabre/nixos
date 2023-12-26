{ config, pkgs, ... }:
let
  tex = (pkgs.texlive.combine {
    inherit (pkgs.texlive) scheme-medium;
  });
in
{ # home-manager
  home.packages = with pkgs; [
    tex
  ];
}
