# cd into script dir
cd "$(dirname '$0')"
pacman -S - < pkgs-pacman-tty.txt
pacman -S - < pkgs-pacman-wayland.txt
