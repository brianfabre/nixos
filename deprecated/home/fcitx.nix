# to fix: currently need to manually add kr to fcitx-configtool
# on first install
{
  config,
  pkgs,
  ...
}: {
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-hangul
      fcitx5-gtk
    ];
  };
}
