setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

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

# my config
export PATH="$HOME/.local/bin:$PATH"
export EDITOR="nvim"
export VISUAL="nvim"
# alias cat='bat -pp --theme Coldark-Dark'
alias nv='nvim'
alias lg='lazygit'
alias rm='rm -i'
alias mv='mv -i'
alias ll='ls -lah'
# colored man pages
export MANPAGER="less -R --use-color -Dd+r -Du+b"
export MANROFFOPT="-P -c"
# fzf
export FZF_DEFAULT_COMMAND="fd --type file --hidden --no-ignore --color=always"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="--ansi --height=40% --reverse --border=none"

function cat() {
    if type bat &> /dev/null; then
        bat -pp --theme Coldark-Dark "$@"
    else
        /bin/cat "$@"
    fi
}

# # Source fzf key-bindings
# if [[ -f "/usr/share/fzf/key-bindings.zsh" ]]; then
#     source "/usr/share/fzf/key-bindings.zsh"
# elif [[ -f "${HOME}/.local/share/fzf/key-bindings.zsh" ]]; then
#     source "${HOME}/.local/share/fzf/key-bindings.zsh"
# fi

# function for if file exists, source
# ex: include ~/.zshrc
include() {
	[[ -f "$1" ]] && source "$1"
}

include /usr/share/fzf/key-bindings.zsh
include /usr/share/fzf/completion.zsh
include /home/brian/.local/share/fzf/key-bindings.zsh
include /usr/share/doc/fzf/examples/key-bindings.zsh

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

##############
# DISTRO     #
##############

# IF ARCH
if [ -f /etc/arch-release ]; then
    # commands for arch linux
    alias pacin="pacman -Slq | fzf --height=100% --multi --preview 'pacman -Si {1}' --preview-window=65% | xargs -ro sudo pacman -S"
    alias pacre="pacman -Qq | fzf --height=100% --multi --preview 'pacman -Qi {1}' --preview-window=65% | xargs -ro sudo pacman -Rns"
# IF MACOS
elif [[ $(uname) == "Darwin" ]]; then
    eval "$(fzf --zsh)"
# IF DEBIAN
# elif [ -f /etc/debian_version ]; then
fi
