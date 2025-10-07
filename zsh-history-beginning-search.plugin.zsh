# zsh-history-beginning-search.plugin.zsh
# ZSH History Beginning Search Plugin
# Enables prefix-based history search using arrow keys

# Custom widget: history search backward + move cursor to end of line
function history-beginning-search-backward-end() {
    zle history-beginning-search-backward
    zle end-of-line
}

# Custom widget: history search forward + move cursor to end of line
function history-beginning-search-forward-end() {
    zle history-beginning-search-forward
    zle end-of-line
}

# Register custom widgets to ZLE
zle -N history-beginning-search-backward-end
zle -N history-beginning-search-forward-end

# Bind arrow keys to custom widgets with cursor-to-end behavior
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end

# Alternative key codes for different terminal emulators
bindkey "\e[A" history-beginning-search-backward-end
bindkey "\e[B" history-beginning-search-forward-end