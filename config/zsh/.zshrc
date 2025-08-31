setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
# bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history

# function for if file exists, source
include() {
	[[ -f "$1" ]] && source "$1"
}

include /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
if [[ -f /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh ]]; then
    bindkey              '^I'         menu-complete
    bindkey "$terminfo[kcbt]" reverse-menu-complete
    # bindkey -M menuselect              '^I'         menu-complete
    # bindkey -M menuselect "$terminfo[kcbt]" reverse-menu-complete
else
    # Use modern completion system
    autoload -Uz compinit && compinit

    zstyle ':completion:*' auto-description 'specify: %d'
    zstyle ':completion:*' completer _expand _complete _correct _approximate
    zstyle ':completion:*' format 'Completing %d'
    zstyle ':completion:*' group-name ''
    zstyle ':completion:*' menu select=2
    # eval "$(dircolors -b)" # doesnt work with mac
    zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
    zstyle ':completion:*' list-colors ''
    zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
    zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
    zstyle ':completion:*' menu select=long
    zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
    zstyle ':completion:*' use-compctl false
    zstyle ':completion:*' verbose true

    zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
    zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
fi

include /usr/share/fzf/key-bindings.zsh
include /usr/share/fzf/shell/key-bindings.zsh
# include /usr/share/fzf/completion.zsh
include /home/brian/.local/share/fzf/key-bindings.zsh
include /usr/share/doc/fzf/examples/key-bindings.zsh
include /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
include /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

zstyle ':completion:*' file-list yes
zstyle ':completion:*' menu select
zstyle -e ':autocomplete:*:*' list-lines 'reply=( $(( LINES / 3 )) )'

# my config
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export EDITOR="nvim"
export VISUAL="nvim"
alias nv='nvim'
alias lg='lazygit'
alias rm='rm -i'
alias mv='mv -i'
alias fcd="cd ~ && cd \$(fd --hidden --type d --exclude .git | fzf)"

# colored man pages
export MANPAGER="less -R --use-color -Dd+r -Du+b"
export MANROFFOPT="-P -c"
# fzf
export FZF_DEFAULT_COMMAND="fd --type file --hidden --no-ignore --color=always --exclude .git"
# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview '~/Downloads/fzf-preview.sh {}'"
export FZF_DEFAULT_OPTS="--ansi --height=90% --layout=reverse --info=inline --border sharp --margin=1 --padding=1 --prompt '∷ ' --pointer ▶  --marker ⇒ "

function cat() {
    if type bat &> /dev/null; then
        bat --theme Coldark-Dark "$@"
    else
        /bin/cat "$@"
    fi
}

ll() {
    if command -v eza > /dev/null; then
        eza -lah "$@"
    else
        ls -lah "$@"
    fi
}

neofetch() {
    if command -v fastfetch > /dev/null; then
        fastfetch
    else
        neofetch
    fi
}

# fe [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fe() {
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

# cdf - cd into the directory of the selected file
cdf() {
   local file
   local dir
   file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
}


# lf cd function
lfcd() {
	tmp="$(mktemp)"
	lf -last-dir-path="$tmp" "$@"
	if [ -f "$tmp" ]; then
		dir="$(cat "$tmp")"
		rm -f "$tmp"
		if [ -d "$dir" ]; then
			if [ "$dir" != "$(pwd)" ]; then
				cd "$dir"
			fi
		fi
	fi
}
alias lf="lfcd"

[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"

##############
# GIT prompt #
##############
# Autoload zsh add-zsh-hook and vcs_info functions (-U autoload w/o substition, -z use zsh style)
autoload -Uz add-zsh-hook vcs_info
# Enable substitution in the prompt.
setopt prompt_subst
# Run vcs_info just before a prompt is displayed (precmd)
add-zsh-hook precmd vcs_info
# add ${vcs_info_msg_0} to the prompt
# e.g. here we add the Git information in red
PROMPT="%F{white}%n%f"  # user
PROMPT+="@"
PROMPT+="%F{cyan}%m%f" # host
PROMPT+="%F{yellow}[%~]%f" # working directory
PROMPT+='%F{red}${vcs_info_msg_0_}%f %# '
# Enable checking for (un)staged changes, enabling use of %u and %c
zstyle ':vcs_info:*' check-for-changes true
# Set custom strings for an unstaged vcs repo changes (*) and staged changes (+)
zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' stagedstr ' +'
# Set the format of the Git information for vcs_info
zstyle ':vcs_info:git:*' formats       '(%b%u%c)'
zstyle ':vcs_info:git:*' actionformats '(%b|%a%u%c)'


# fkill - kill processes - list only the ones you can kill. Modified the earlier script.
fkill() {
	local pid
	if [ "$UID" != "0" ]; then
		pid=$(ps -f -u $UID | sed 1d | fzf -m | awk '{print $2}')
	else
		pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
	fi

	if [ "x$pid" != "x" ]; then
		echo $pid | xargs kill -${1:-9}
	fi
}

##########
# DISTRO #
##########

# IF ARCH
if [ -f /etc/arch-release ]; then
    # commands for arch linux
    alias pacin="pacman -Slq | fzf --height=100% --multi --preview 'pacman -Si {1}' --preview-window=65% | xargs -ro sudo pacman -S"
    alias pacre="pacman -Qq | fzf --height=100% --multi --preview 'pacman -Qi {1}' --preview-window=65% | xargs -ro sudo pacman -Rns"
# IF MACOS
elif [[ $(uname) == "Darwin" ]]; then

    # fzf
    eval "$(fzf --zsh)"

    # zoxide
    eval "$(zoxide init zsh)"
    alias cd="z"

    # pyenv
    export PYENV_ROOT="$HOME/.pyenv"
    [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
# IF DEBIAN
# elif [ -f /etc/debian_version ]; then
fi

# fzf for nixos
if [ -n "${commands[fzf-share]}" ]; then
  source "$(fzf-share)/key-bindings.zsh"
  source "$(fzf-share)/completion.zsh"
fi

# for yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}
