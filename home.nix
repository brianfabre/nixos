{ config, pkgs, ... }:

{
  home.username = "brian";
  home.homeDirectory = "/home/brian";

  home.packages = with pkgs; [
    lf
    fzf
    ripgrep
    lazygit
  ];

  programs.git = {
    enable = true;
    userName = "brian";
    userEmail = "briankim53@gmail.com";
  };

  programs.kitty.enable = true;
  programs.firefox.enable = true;
  
  home.file = {
    ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "/home/brian/nixos/config/nvim";
  };

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
