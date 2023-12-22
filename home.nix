{ config, pkgs, inputs, ... }:
{
  home.username = "brian";
  home.homeDirectory = "/home/brian";

  programs.git = {
    enable = true;
    userName = "brian kim";
    userEmail = "briankim53@gmail.com";
  };

  imports = [
    ./modules/firefox.nix
    ./modules/zsh.nix
  ];

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # here is some command line tools I use frequently
    # feel free to add your own or remove some of them

    #
    lf
    neovim

    # archives
    zip
    xz
    unzip
    p7zip

    # other
    dunst
    eza
    fd
    fzf
    lazygit
    lua-language-server
    mupdf
    ncdu
    neofetch
    # prettier
    R
    ripgrep
    stylua
    tesseract
    xdg-utils
    xfce.thunar
    usbutils
    zathura
  ];

  home.file = {
    ".config/dunst".source = config.lib.file.mkOutOfStoreSymlink "/home/brian/nixos/config/dunst";
    ".config/foot".source = config.lib.file.mkOutOfStoreSymlink "/home/brian/nixos/config/foot";
    ".config/lf".source = config.lib.file.mkOutOfStoreSymlink "/home/brian/nixos/config/lf";
    ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "/home/brian/nixos/config/nvim";
    ".config/utils".source = config.lib.file.mkOutOfStoreSymlink "/home/brian/nixos/config/utils";
    ".config/xkb".source = config.lib.file.mkOutOfStoreSymlink "/home/brian/nixos/config/xkb";
    ".config/yambar".source = config.lib.file.mkOutOfStoreSymlink "/home/brian/nixos/config/yambar";
    ".config/zathura".source = config.lib.file.mkOutOfStoreSymlink "/home/brian/nixos/config/zathura";
    ".config/mimeapps.list".source = config.lib.file.mkOutOfStoreSymlink "/home/brian/nixos/config/mimeapps.list";
  };

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

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
