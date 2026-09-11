function rgf --description 'live ripgrep, open match in $EDITOR'
    set -l rg_cmd 'rg --column --line-number --no-heading --color=always --smart-case'
    set -l picked (
        FZF_DEFAULT_COMMAND="$rg_cmd ''" fzf \
            --ansi --disabled --delimiter : \
            --bind "change:reload:$rg_cmd {q} || true" \
            --preview 'bat --style=numbers --color=always --highlight-line {2} -- {1}' \
            --preview-window 'up,60%,border-bottom,+{2}+3/3'
    )
    test -z "$picked"; and return
    set -l parts (string split -m 2 : -- $picked)
    $EDITOR +$parts[2] $parts[1]
end
