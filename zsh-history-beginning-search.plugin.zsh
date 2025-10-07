# zsh-history-beginning-search.plugin.zsh
# ZSH History Beginning Search Plugin
# Enables prefix-based history search using arrow keys

# Variable to store the search prefix position
typeset -g _HISTORY_SEARCH_PREFIX_POS

# Custom widget: history search backward + move cursor to end of line
function history-beginning-search-backward-end() {
    # If this is the first search or we changed the input, save prefix position
    if [[ $LASTWIDGET != history-beginning-search-*-end ]]; then
        _HISTORY_SEARCH_PREFIX_POS=$CURSOR
    else
        # Restore cursor to prefix position for continuous search
        CURSOR=$_HISTORY_SEARCH_PREFIX_POS
    fi

    # Perform history search
    zle history-beginning-search-backward

    # Move cursor to end of line after search
    zle end-of-line
}

# Custom widget: history search forward + move cursor to end of line
function history-beginning-search-forward-end() {
    # If this is the first search or we changed the input, save prefix position
    if [[ $LASTWIDGET != history-beginning-search-*-end ]]; then
        _HISTORY_SEARCH_PREFIX_POS=$CURSOR
    else
        # Restore cursor to prefix position for continuous search
        CURSOR=$_HISTORY_SEARCH_PREFIX_POS
    fi

    # Perform history search
    zle history-beginning-search-forward

    # Move cursor to end of line after search
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