# Load configurations
readonly XRESOURCES_PATH="$HOME/.Xresources"

if [ -f "$XRESOURCES_PATH" ]; then
    xrdb "$XRESOURCES_PATH"
fi

alias ls='ls -h --color=auto'
