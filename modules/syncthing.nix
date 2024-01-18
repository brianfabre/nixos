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
        "samsung-a52s" = {id = "P2FYLQW-PKDFJGZ-EUGI2T7-OW4AH4I-KI462HD-U2VL3X3-GN55PP2-VNRE5AH";};
      };

      folders = {
        "Photos" = {
          path = "/home/${user}/.local/share/syncthing/photos";
          devices = ["samsung-a52s"];
        };
      };

      options.globalAnnounceEnabled = false; # Only sync on LAN
    };
  };
}
