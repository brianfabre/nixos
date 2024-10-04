{
  programs.hyprland.enable = true;
  services.hypridle.enable = true;
  programs.hyprlock.enable = true;
  # Hyprlock needs PAM access to authenticate, else it fallbacks to su
  security.pam.services.hyprlock = {};

  # Enable Display Manager
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        # command = "${pkgs.greetd.tuigreet}/bin/tuigreet --remember --time --time-format '%I:%M %p | %a • %h | %F' --cmd Hyprland";
        command = "${pkgs.greetd.greetd}/bin/agreety --cmd Hyprland";
        user = "greeter";
      };
    };
  };
}
