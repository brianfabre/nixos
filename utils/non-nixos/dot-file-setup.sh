SOURCE_DIR="$HOME/nixos/config"
TARGET_DIR="$HOME/.config"

# download arch packages
# sudo pacman -S base-devel git curl eza fd fzf htop lazygit lf ncdu neofetch neovim prettier ripgrep rsync stylua tealdeer tree unzip vim wget zsh bash-language-server lua-language-server shfmt

# create symlinks to dotfiles
if [ -d "$SOURCE_DIR" ]; then

	ln -sf $SOURCE_DIR/lf $TARGET_DIR/lf
	ln -sf $SOURCE_DIR/nvim $TARGET_DIR/nvim

	ln -sf $SOURCE_DIR/zsh/.zshrc $HOME/.zshrc

	echo "symbolic link created"

else

	echo "$SOURCE_DIR doesn't exist"

fi
