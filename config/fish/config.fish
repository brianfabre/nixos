if status is-interactive
# Commands to run in interactive sessions can go here
end

fzf --fish | source
bind --erase \ec        # remove alt-c (cd into dir)


abbr -a nv nvim
abbr -a lg lazygit
abbr -a tu 'tailscale up'
abbr -a td 'tailscale down'


bind \cz 'fg 2>/dev/null; commandline -f repaint'  # ctrl-z toggles back into job

zoxide init --cmd cd fish | source
