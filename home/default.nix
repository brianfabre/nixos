{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  home.username = "brian";
  home.homeDirectory = "/home/brian";

  programs.git = {
    enable = true;
    userName = "brian kim";
    userEmail = "briankim53@gmail.com";
  };

  imports = [
    ./firefox.nix
    ./fcitx.nix
    ./tex.nix
    ./zsh.nix
  ];

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    #
    lf
    neovim

    # archives
    alacritty
    zip
    xz
    unzip
    p7zip

    # other
    bat
    brightnessctl
    calibre
    chromium
    dunst
    eza
    fd
    fzf
    gsimplecal
    imv
    lazygit
    mpv
    mupdf
    ncdu
    neofetch
    pavucontrol
    qbittorrent
    R
    ripgrep
    tesseract
    xdg-utils
    xfce.thunar
    usbutils
    zathura
    zellij
    zotero_beta

    # language server
    nodePackages.bash-language-server
    lua-language-server

    # formatter
    alejandra
    nodePackages.prettier
    shfmt
    stylua

    # lf image preview
    chafa
    ffmpegthumbnailer
    poppler_utils # pdftoppm

    # wayland
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

  home.file = {
    ".config/dunst".source = config.lib.file.mkOutOfStoreSymlink "/home/brian/nixos/config/dunst";
    ".config/foot".source = config.lib.file.mkOutOfStoreSymlink "/home/brian/nixos/config/foot";
    ".config/lf".source = config.lib.file.mkOutOfStoreSymlink "/home/brian/nixos/config/lf";
    ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "/home/brian/nixos/config/nvim";
    ".config/utils".source = config.lib.file.mkOutOfStoreSymlink "/home/brian/nixos/config/utils";
    ".config/wireplumber".source = config.lib.file.mkOutOfStoreSymlink "/home/brian/nixos/config/wireplumber";
    ".config/xkb".source = config.lib.file.mkOutOfStoreSymlink "/home/brian/nixos/config/xkb";
    ".config/yambar".source = lib.mkDefault (config.lib.file.mkOutOfStoreSymlink "/home/brian/nixos/config/yambar");
    ".config/zathura".source = config.lib.file.mkOutOfStoreSymlink "/home/brian/nixos/config/zathura";
    ".config/mimeapps.list".source = config.lib.file.mkOutOfStoreSymlink "/home/brian/nixos/config/mimeapps.list";
  };

  # cursor
  home.file.".icons/default".source = "${pkgs.vanilla-dmz}/share/icons/Vanilla-DMZ";

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
