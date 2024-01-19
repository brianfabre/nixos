{...}: let
  user = "brian";
in {
  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
    dataDir = "/home/${user}/.local/share/syncthing";
    configDir = "/home/${user}/.config/syncthing";
    user = "${user}";
    group = "users";
    overrideFolders = true;
    overrideDevices = true;

    settings = {
      devices = {
        "samsung-a52s" = {id = "AOYKQS6-6OIEVXE-OBZKRNG-5EFUZWM-WI6WEUH-F42257M-RQV4UK6-KO4RVAD";};
      };

      folders = {
        "Photos" = {
          id = "sm-a528b_p7zw-photos";
          path = "/home/${user}/.local/share/syncthing/photos";
          devices = ["samsung-a52s"];
        };
      };

      options.globalAnnounceEnabled = false; # Only sync on LAN
    };
  };
}
