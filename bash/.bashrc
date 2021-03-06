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

# Homebrew
pathmunge /usr/local/sbin
pathmunge /usr/local/bin

# Homebrew - coreutils
pathmunge /usr/local/opt/coreutils/libexec/gnubin

# Load configurations
readonly XRESOURCES_PATH="$HOME/.Xresources"

if [ -f "$XRESOURCES_PATH" ] && which xrdb > /dev/null; then
    xrdb "$XRESOURCES_PATH"
fi

# Emacs environments
readonly EMACS_ENVIRONMENT_ROOT="$HOME/.emacsenv.d"
readonly PRELUDE="$EMACS_ENVIRONMENT_ROOT/prelude"
readonly SPACEMACS="$EMACS_ENVIRONMENT_ROOT/spacemacs"
readonly SPACEMACS_DEV="$HOME/Programming/Emacs/spacemacs-dev"
readonly SPACEMACS_INIT_PATH="$SPACEMACS/private/local"

# Aliases
alias as='nohup studio.sh &> /dev/null &'
alias ffdd='nohup /opt/firefox-developer-edition/firefox -P dev-edition-default &> /dev/null &'
alias ffdp='nohup /opt/firefox-developer-edition/firefox -P personal &> /dev/null &'
alias ffdw='nohup /opt/firefox-developer-edition/firefox -P work &> /dev/null &'
alias ffp='nohup firefox -P personal &> /dev/null &'
alias ffw='nohup firefox -P work &> /dev/null &'
alias ls='ls -h --color=auto'
alias pec='emacsclient -s prelude -nc'
alias ped="EMACS_USER_DIRECTORY=$PRELUDE emacs --daemon"
alias pek="emacsclient -s prelude -e '(kill-emacs)'"
alias pesk="emacsclient -s prelude -e '(save-buffers-kill-emacs)'"
alias pew='emacsclient -s prelude -nw'
alias spec='emacsclient -s spacemacs -nc'
alias sped="EMACS_USER_DIRECTORY=$SPACEMACS SPACEMACSDIR=$SPACEMACS_INIT_PATH emacs --daemon"
alias spek="emacsclient -s spacemacs -e '(kill-emacs)'"
alias spesk="emacsclient -s spacemacs -e '(save-buffers-kill-emacs)'"
alias spew='emacsclient -s spacemacs -nw'
alias spedc='emacsclient -s spacemacs-dev -nc'
alias spedd="EMACS_USER_DIRECTORY=$SPACEMACS_DEV SPACEMACSDIR=$SPACEMACS_INIT_PATH emacs --daemon"
alias spedk="emacsclient -s spacemacs-dev -e '(kill-emacs)'"
alias spedsk="emacsclient -s spacemacs-dev -e '(save-buffers-kill-emacs)'"
alias spedw='emacsclient -s spacemacs-dev -nw'

# rbenv
readonly RBENV_PATH="$HOME/.rbenv"

if [ -d "$RBENV_PATH" ]; then
    pathmunge "$RBENV_PATH/bin"
    eval "$(rbenv init -)"
fi

# Android Studio
readonly ANDROID_STUDIO_PATH="$HOME/Programming/Android/Android-Studio"

if [ -d "$ANDROID_STUDIO_PATH" ]; then
    pathmunge "$ANDROID_STUDIO_PATH/bin"
fi

# jenv
readonly JENV_PATH="$HOME/.jenv"

if [ -d "$JENV_PATH" ]; then
  . "$JENV_PATH/bin/jenv-init.sh"
  . "$JENV_PATH/commands/completion.sh"
fi

pathmunge "$HOME/bin"

# IBus
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

# nvm
readonly NVM_DIR="$HOME/.nvm"

if [ -s "$NVM_DIR/nvm.sh" ]; then
    . "$NVM_DIR/nvm.sh"
fi

# Set the default terminal emulator for i3-sensible-terminal
export TERMINAL=urxvt256c-ml

# Franz
readonly FRANZ_PATH="$HOME/bin/Franz"

if [ -d "$FRANZ_PATH" ]; then
    pathmunge "$FRANZ_PATH"
fi

# Popcorn-Time
readonly POPCORN_TIME_PATH="$HOME/bin/Popcorn-Time"

if [ -d "$POPCORN_TIME_PATH" ]; then
    pathmunge "$POPCORN_TIME_PATH"
fi

pathmunge "$HOME/.cargo/bin"

# Shopify AdBlocker
readonly SHOPIFY_ADBLOCKER_PATH="$HOME/Programming/spotify-blacklist-mute"

if [ -d "$SHOPIFY_ADBLOCKER_PATH" ]; then
    pathmunge "$SHOPIFY_ADBLOCKER_PATH"
fi
