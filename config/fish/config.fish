if status is-interactive
# Commands to run in interactive sessions can go here
end

/opt/homebrew/bin/brew shellenv | source
fish_add_path -gm ~/.cargo/bin ~/.local/bin

fzf --fish | source
bind --erase \ec        # remove alt-c (cd into dir)


abbr -a nv nvim
abbr -a lg lazygit
abbr -a tu 'mullvad disconnect && tailscale up'
abbr -a td 'tailscale down && mullvad connect'


bind \cz 'fg 2>/dev/null; commandline -f repaint'  # ctrl-z toggles back into job

zoxide init --cmd cd fish | source

set -gx EDITOR nvim
set -gx VISUAL nvim

set -gx MANPAGER "less -R --use-color -Dd+r -Du+b"
set -gx MANROFFOPT "-P -c"

set -gx FZF_DEFAULT_COMMAND "fd --type file --hidden --no-ignore --color=always --exclude .git"
set -gx FZF_CTRL_T_OPTS "--preview '~/Downloads/fzf-preview.sh {}'"
set -gx FZF_DEFAULT_OPTS "--ansi --height=90% --layout=reverse --info=inline --border sharp --margin=1 --padding=1 --prompt '∷ ' --pointer ▶ --marker ⇒"
