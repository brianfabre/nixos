{ config, pkgs, lib, ... }:
{
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
    yambar
  ];

  nixpkgs.overlays = [
    (final: prev: {
      dwl = prev.dwl.overrideAttrs (old: {
	      src = ./../source/dwl ;
          # src = prev.fetchFromGitHub {
          #   owner = "brianfabre";
          #   repo = "dwl";
          #   rev = "fccec48af345bd64088be8076b2df11d137a2aaf";
          #   hash = "sha256-G3bw7Sklgfg9hfaORKoEOT8JHiZ2uIoxy3rOqncGvTk=";
          # };
          buildInputs = with pkgs; [
            libinput
            xorg.libxcb
            libxkbcommon
            pixman
            wayland
            wayland-protocols

            (wlroots_0_16.overrideAttrs (oldAttrs: {
              version = "fe53ec693789afb44c899cad8c2df70c8f9f9023";
              buildInputs = with pkgs;
                oldAttrs.buildInputs ++ [ hwdata libdisplay-info ];
              src = pkgs.fetchFromGitLab {
                domain = "gitlab.freedesktop.org";
                owner = "wlroots";
                repo = "wlroots";
                rev = "fe53ec693789afb44c899cad8c2df70c8f9f9023";
                sha256 = "sha256-ah8TRZemPDT3NlPAHcW0+kUIZojEGkXZ53I/cNeCcpA=";
              };
            }))

            xorg.libX11
            xorg.xcbutilwm
            xwayland
          ];
      });
    })
  ];
}
