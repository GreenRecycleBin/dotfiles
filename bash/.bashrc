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
alias as='nohup studio.sh &> /dev/null &'
alias ec='emacsclient -nc'
alias ed='emacs --daemon'
alias ek="emacsclient -e '(kill-emacs)'"
alias esk="emacsclient -e '(save-buffers-kill-emacs)'"
alias ew='emacsclient -nw'
alias ffp='nohup firefox -P personal &> /dev/null &'
alias ffw='nohup firefox -P work &> /dev/null &'
alias ls='ls -h --color=auto'

# rbenv
readonly RBENV_PATH="$HOME/.rbenv"

if [ -d "$RBENV_PATH" ]; then
    export "PATH=$RBENV_PATH/bin:$PATH"
    eval "$(rbenv init -)"
fi

# Android Studio
readonly ANDROID_STUDIO_PATH="$HOME/Programming/Android/Android-Studio"

if [ -d "$ANDROID_STUDIO_PATH" ]; then
    export "PATH=$ANDROID_STUDIO_PATH/bin:$PATH"
fi
