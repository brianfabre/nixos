{ pkgs, ... }:
{
  # default cursor too small on HIDPI monitor
  home.pointerCursor =
    let
      getFrom = url: hash: name: {
          gtk.enable = true;
          x11.enable = true;
          name = name;
          size = 48;
          package =
            pkgs.runCommand "moveUp" {} ''
              mkdir -p $out/share/icons
              ln -s ${pkgs.fetchzip {
                url = url;
                hash = hash;
              }} $out/share/icons/${name}
          '';
        };
    in
      getFrom
        "https://github.com/ful1e5/Bibata_Cursor/releases/download/v2.0.4/Bibata-Original-Classic.tar.xz"
        "sha256-38l5eaRmujGc3TF/sSkdImBkFrgDCB/0ijj7H0t8xrE="
        "Bibata";
}
