{
  config,
  pkgs,
  inputs,
  ...
}: {
  home.username = "brian";
  home.homeDirectory = "/home/brian";

  imports = [
    ./home/firefox.nix
    # ./fcitx.nix
    # ./tex.nix
    # ./zsh.nix
  ];

  home.packages = with pkgs; [
    lf
    fd
    fzf
    ripgrep
    lazygit
    neovim

    # archives
    zip
    xz
    unzip
    p7zip

    # other
    bat
    brightnessctl
    # calibre
    dunst
    eza
    # gsimplecal
    htop
    imv
    mpv
    mupdf
    ncdu
    neofetch
    # qbittorrent
    tealdeer
    tesseract
    xdg-utils
    xfce.thunar
    usbutils
    zathura
    # zellij
    # zotero_beta

    gnome-power-manager

    # NM tray on waybar
    # networkmanagerapplet

    # bash
    shfmt
    nodePackages.bash-language-server
    # lua
    stylua
    lua-language-server
    # nixos
    alejandra
    # formatter
    nodePackages.prettier

    # lf image preview
    chafa
    ffmpegthumbnailer
    poppler_utils # pdftoppm

    # wayland
    bemenu
    clipman
    foot
    gammastep
    grim
    kanshi
    slurp
    swaybg
    waybar
    wev
    wl-clipboard
    wlr-randr

    nfs-utils
  ];

  programs.git = {
    enable = true;
    userName = "brian";
    userEmail = "briankim53@gmail.com";
  };

  home.file = {
    ".config/foot".source = config.lib.file.mkOutOfStoreSymlink "/home/brian/nixos/config/foot";
    ".config/hypr".source = config.lib.file.mkOutOfStoreSymlink "/home/brian/nixos/config/hypr-t480";
    ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "/home/brian/nixos/config/nvim";
    ".config/labwc".source = config.lib.file.mkOutOfStoreSymlink "/home/brian/nixos/config/labwc";
    ".config/lf".source = config.lib.file.mkOutOfStoreSymlink "/home/brian/nixos/config/lf";
    ".config/waybar".source = config.lib.file.mkOutOfStoreSymlink "/home/brian/nixos/config/waybar";
    ".config/zathura".source = config.lib.file.mkOutOfStoreSymlink "/home/brian/nixos/config/zathura";
    ".zshrc".source = config.lib.file.mkOutOfStoreSymlink "/home/brian/nixos/config/zsh/.zshrc";
    ".config/mimeapps.list".source = config.lib.file.mkOutOfStoreSymlink "/home/brian/nixos/config/mimeapps.list";
  };

  # cursor
  home.file.".icons/default".source = "${pkgs.vanilla-dmz}/share/icons/Vanilla-DMZ";

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
