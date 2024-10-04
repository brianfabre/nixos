{
  programs.hyprland.enable = true;
  services.hypridle.enable = true;
  programs.hyprlock.enable = true;
  # Hyprlock needs PAM access to authenticate, else it fallbacks to su
  security.pam.services.hyprlock = {};
}
