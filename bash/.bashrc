# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
elif [ -f /etc/bash.bashrc ]; then
    . /etc/bash.bashrc
fi

# Enable Bash completion in interactive shells
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# Unlimited history (http://superuser.com/a/479727/92994)
export HISTSIZE=""

# User specific aliases and functions

pathmunge () {
    case ":${PATH}:" in
        *:"$1":*)
        ;;
        *)
            if [ "$2" = 'after' ]; then
                PATH=$PATH:$1
            else
                PATH=$1:$PATH
            fi
    esac
}

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
alias ffd='nohup /opt/firefox-developer-edition/firefox -P dev-edition-default &> /dev/null &'
alias ffp='nohup firefox -P personal &> /dev/null &'
alias ffw='nohup firefox -P work &> /dev/null &'
alias ls='ls -h --color=auto'

# rbenv
readonly RBENV_PATH="$HOME/.rbenv"

if [ -d "$RBENV_PATH" ]; then
    pathmunge "$RBENV_PATH"
    eval "$(rbenv init -)"
fi

# Android Studio
readonly ANDROID_STUDIO_PATH="$HOME/Programming/Android/Android-Studio"

if [ -d "$ANDROID_STUDIO_PATH" ]; then
    pathmunge "$ANDROID_STUDIO_PATH/bin"
fi

# Homebrew
export PATH="/usr/local/bin:$PATH"

# Homebrew - coreutils
pathmunge /usr/local/opt/coreutils/libexec/gnubin

pathmunge "$HOME/bin"
