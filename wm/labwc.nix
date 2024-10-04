{
  programs.labwc.enable = true;

  # Enable Display Manager
  services.greetd = {
    enable = false;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --remember --time --time-format '%I:%M %p | %a • %h | %F' --cmd labwc";
        # command = "${pkgs.greetd.greetd}/bin/agreety --cmd Hyprland";
        user = "greeter";
      };
    };
  };
}
