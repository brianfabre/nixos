# ~/.config/fish/functions/fe.fish
function fe --description 'fuzzy-find a file and open it in $EDITOR'
    argparse --name=fe h/help H/home u/unfiltered -- $argv
    or return

    if set -q _flag_help
        echo 'usage: fe [-H|--home] [-u|--unfiltered] [QUERY...]'
        echo '  -H  search from ~ instead of the current directory'
        echo '  -u  skip the shared $fd_prune exclusions'
        return
    end

    set -l root .
    set -q _flag_home; and set root $HOME

    set -l prune
    set -q _flag_unfiltered; or set prune $fd_prune

    set -l preview 'cat -- {}'
    type -q bat; and set preview 'bat --style=numbers --color=always --line-range=:300 -- {}'

    set -l files (
        fd $prune --type f --hidden --follow . $root \
            | fzf --multi --scheme=path --query "$argv" \
                --preview $preview \
                --preview-window 'right,60%,border-left' \
                --bind 'ctrl-/:toggle-preview'
    )

    test -z "$files"; and return

    set -l ed (string split ' ' -- (test -n "$EDITOR"; and echo $EDITOR; or echo vi))
    $ed $files
end
