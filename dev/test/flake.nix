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
            s-tui
            stress-ng
            ffmpeg
            # 'sudo ventoy-web' to launch web-gui
            ventoy-full
          ];
        };
      }
    );
}
