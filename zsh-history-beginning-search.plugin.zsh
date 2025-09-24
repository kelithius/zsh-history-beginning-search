# zsh-history-beginning-search.plugin.zsh
# ZSH History Beginning Search Plugin  
# Enables prefix-based history search using arrow keys

# Enable history beginning search - search based on current input prefix
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

# Alternative key codes for different terminal emulators
bindkey "\e[A" history-beginning-search-backward  
bindkey "\e[B" history-beginning-search-forward