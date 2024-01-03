{pkgs, ...}: {
  # Enable Display Manager
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --remember --time --time-format '%I:%M %p | %a • %h | %F' --cmd 'dwl > /home/brian/.cache/dwl_info'";
        user = "greeter";
      };
    };
  };

  environment.systemPackages = with pkgs; [
    greetd.tuigreet
  ];
}
