function fcd --description "fuzzy cd"
    set -l roots $argv
    test (count $roots) -eq 0; and set roots ~

    set -l dir (fd --type d --hidden --follow \
        --exclude .git \
        --exclude Library \
        --exclude 'Calibre Library' \
        . $roots \
        | fzf --reverse --height=60% --preview 'ls -1 {}')

    test -z "$dir"; and return
    cd -- $dir
end
