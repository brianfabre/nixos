{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    initExtraFirst = ''
    '';
    initExtra = ''
      if [ -n "''${commands[fzf-share]}" ]; then
        source "''$(fzf-share)/key-bindings.zsh"
        source "''$(fzf-share)/completion.zsh"
      fi

      # find and set branch name var if in git repository.
      function git_branch_name()
      {
        branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
        if [[ $branch == "" ]];
        then
          :
        else
          echo ' - ('$branch')'
        fi
      }

      # enable substitution in prompt.
      setopt prompt_subst
      # config for prompt. ps1 synonym.
      PROMPT='[%~$(git_branch_name)]$ '
      # PROMPT="[%n %~]$ "

      export EDITOR="nvim"
      export VISUAL="nvim"
      export OPENER=xdg-open

      # colored man pages
      export MANPAGER="less -R --use-color -Dd+r -Du+b"
      export MANROFFOPT="-P -c"

      # function for if file exists, source
      # ex: include ~/.zshrc
      include() {
      	[[ -f "$1" ]] && source "$1"
      }

      # pacman
      alias pacin="pacman -Slq | fzf --height=100% --multi --preview 'pacman -Si {1}' --preview-window=65% | xargs -ro sudo pacman -S"
      alias pacre="pacman -Qq | fzf --height=100% --multi --preview 'pacman -Qi {1}' --preview-window=65% | xargs -ro sudo pacman -Rns"

      # bemenu
      export BEMENU_OPTS="--fn 'Hack 11'"

      # fzf
      export FZF_DEFAULT_COMMAND="fd --type file --hidden --no-ignore --color=always"
      export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
      export FZF_DEFAULT_OPTS="--ansi --height=40% --reverse --border=none"

      # Edit line in vim with ctrl-e:
      autoload edit-command-line
      zle -N edit-command-line
      bindkey '^e' edit-command-line

      set -o emacs

      alias nv="nvim"
      alias lg="lazygit"
      alias rm='rm -i'
      alias mv='mv -i'
      alias ls='eza'
      alias ll='eza -lab --icons'
      alias lz='NVIM_APPNAME=lazyvim nvim'
      alias ks='NVIM_APPNAME=nvim-ks nvim'

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

      # fkill - kill processes - list only the ones you can kill
      fkill() {
      	local pid
      	if [ "$UID" != "0" ]; then
      		pid=$(ps -f -u $UID | sed 1d | fzf -m | awk '{print $2}')
      	else
      		pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
      	fi

      	if [ "x$pid" != "x" ]; then
      		echo $pid | xargs kill -''${1:-9}
      	fi
      }

      # search files fzf
      fe() {
      	files=(''$(
      	    fd -t f --color=always --hidden --no-ignore-vcs \
      	    	--exclude ".git" \
      	    	--exclude ".local" \
    	    	--exclude "mnt" |
      	    	fzf-tmux --query="''$1" --multi --select-1 --exit-0
      	))
      	if [[ -n "''$files" ]]; then
      		for file in "''${files[@]}"; do
      			extension="''${file##*.}"
      			if [[ "''$extension" =~ (pdf|jpg|jpeg|JPG|png)''$ ]]; then
      				xdg-open "''$file"
      			else
      				''${EDITOR:-vim} "''$file"
      			fi
      		done
      	fi
      }

      # cd to directory fzf
      fcd() {
      	local dir
      	dir=''$(fd ''${1:-.} --exclude '.git' \
      		--exclude '.mozilla' \
      		--exclude '_*' \
      		-t d --hidden --no-ignore-vcs | fzf-tmux +m) &&
      		cd "''$dir"
      }

      # zsh completion
      zstyle ':completion:*' menu select
    '';
    plugins = [
      {
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          rev = "v0.4.0";
          sha256 = "0z6i9wjjklb4lvr7zjhbphibsyx51psv50gm07mbb0kj9058j6kc";
        };
      }
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "0.7.1";
          sha256 = "03r6hpb5fy4yaakqm3lbf4xcvd408r44jgpv4lnzl9asp4sb9qc0";
        };
      }
    ];
  };
}
