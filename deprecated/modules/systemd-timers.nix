# currently inactive
{
  systemd.timers."sync-photos" = {
    description = "timer for sync-photos";
    wantedBy = ["timers.target"];
    timerConfig = {
      OnBootSec = "5m";
      OnUnitActiveSec = "5m";
      Unit = "sync-photos.service";
    };
  };

  systemd.services."sync-photos" = {
    description = "sync syncthing photos with nas";
    script = ''
      echo "hello world"
    '';
    serviceConfig = {
      User = "brian";
      OnCalendar = "daily";
      Persistent = true;
    };
  };
}
