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

            # hashcat
            # hashcat
            # hcxtools

            # zellij

            # ffmpeg

            # xournal

            # go-mtpfs

            # libinput

            # lxqt.lxqt-panel

            gnome.simple-scan
          ];
        };
      }
    );
}
