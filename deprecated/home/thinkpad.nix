{
  config,
  lib,
  pkgs,
  ...
}: {
  # use diff conf
  home.file = {
    ".config/yambar".source = lib.mkForce (config.lib.file.mkOutOfStoreSymlink "/home/brian/nixos/config/yambar-thinkpad");
  };

  # use diff userchrome
  programs.firefox.profiles.default.userChrome = lib.mkForce (builtins.readFile ./../config/firefox/userChrome-thinkpad.css);
}
