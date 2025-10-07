# zsh-history-beginning-search.plugin.zsh
# ZSH History Beginning Search Plugin
# Enables prefix-based history search using arrow keys with cursor auto-positioning

# Global variable to store the initial search prefix cursor position
typeset -g __HISTORY_SEARCH_INITIAL_CURSOR_POS

# Helper function: manage cursor position and perform history search
# Args: $1 - direction (backward|forward)
_history_search_with_cursor_to_end() {
    local direction=$1

    # Save initial cursor position on first search, restore it on continuous search
    if [[ $LASTWIDGET != history-beginning-search-*-end ]]; then
        __HISTORY_SEARCH_INITIAL_CURSOR_POS=$CURSOR
    else
        CURSOR=${__HISTORY_SEARCH_INITIAL_CURSOR_POS:-0}
    fi

    # Perform history search in specified direction
    zle history-beginning-search-$direction

    # Move cursor to end of line
    zle end-of-line
}

# Backward search widget
history-beginning-search-backward-end() {
    _history_search_with_cursor_to_end backward
}

# Forward search widget
history-beginning-search-forward-end() {
    _history_search_with_cursor_to_end forward
}

# Register widgets
zle -N history-beginning-search-backward-end
zle -N history-beginning-search-forward-end

# Key bindings for up/down arrows
# Format: ^[[A (CSI sequence) and \e[A (ESC sequence) for terminal compatibility
bindkey '^[[A' history-beginning-search-backward-end  # Up arrow (CSI)
bindkey '^[[B' history-beginning-search-forward-end   # Down arrow (CSI)
bindkey '\e[A' history-beginning-search-backward-end  # Up arrow (ESC)
bindkey '\e[B' history-beginning-search-forward-end   # Down arrow (ESC)