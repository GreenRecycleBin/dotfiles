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
alias ls='ls -h --color=auto'
