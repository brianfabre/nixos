{lib, ...}: {
  # imports = [
  #   ./hardware-configuration.nix
  # ];

  networking.hostName = lib.mkForce "nixos"; # Define your hostname.

  services = {
    fstrim.enable = lib.mkDefault true;

    # fix for intel cpu throttling
    throttled.enable = lib.mkDefault true;

    tlp = {
      enable = true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";

        PLATFORM_PROFILE_ON_AC = "performance";
        PLATFORM_PROFILE_ON_BAT = "balanced";

        DEVICES_TO_DISABLE_ON_BAT_NOT_IN_USE = ["bluetooth" "wifi"];
        DEVICES_TO_ENABLE_ON_AC = ["bluetooth" "wifi"];

        # when need to use battery
        START_CHARGE_THRESH_BAT1 = 80;
        STOP_CHARGE_THRESH_BAT1 = 85;

        # START_CHARGE_THRESH_BAT1 = 65;
        # STOP_CHARGE_THRESH_BAT1 = 70;
      };
    };
    upower = {
      enable = true;
      # criticalPowerAction = "Hibernate";
    };
  };
}
