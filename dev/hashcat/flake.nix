{
  description = "desc";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {inherit system;};
      in {
        devShell = pkgs.mkShell {
          nativeBuildInputs = with pkgs; [
            # s-tui
            # stress-ng

            # ffmpeg

            # wireshark

            # 'sudo ventoy-web' to launch web-gui
            # ventoy-full

            # music metadata edit
            # kid3

            # appimage-run

            # jdupes

            hashcat
            hcxtools

            git
            gitRepo
            gnupg
            autoconf
            curl
            procps
            gnumake
            util-linux
            m4
            gperf
            unzip
            cudatoolkit
            linuxPackages.nvidia_x11
            libGLU
            libGL
            xorg.libXi
            xorg.libXmu
            freeglut
            xorg.libXext
            xorg.libX11
            xorg.libXv
            xorg.libXrandr
            zlib
            ncurses5
            stdenv.cc
            binutils
          ];

          shellHook = ''
            export CUDA_PATH=${pkgs.cudatoolkit}
            # export LD_LIBRARY_PATH=${pkgs.linuxPackages.nvidia_x11}/lib:${pkgs.ncurses5}/lib
            export EXTRA_LDFLAGS="-L/lib -L${pkgs.linuxPackages.nvidia_x11}/lib"
            export EXTRA_CCFLAGS="-I/usr/include"
          '';
        };
      }
    );
}
