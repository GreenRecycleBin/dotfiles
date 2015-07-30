# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

# Load configurations
readonly XRESOURCES_PATH="$HOME/.Xresources"

if [ -f "$XRESOURCES_PATH" ]; then
    xrdb "$XRESOURCES_PATH"
fi

# Aliases
alias ec='emacsclient -nc'
alias ed='emacs --daemon'
alias ek="emacsclient -e '(kill-emacs)'"
alias esk="emacsclient -e '(save-buffers-kill-emacs)'"
alias ffp='nohup firefox -P personal &> /dev/null &'
alias ffw='nohup firefox -P work &> /dev/null &'
alias ls='ls -h --color=auto'

# rbenv
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"
