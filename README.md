# ZSH History Beginning Search

A ZSH plugin that enables prefix-based history search using arrow keys, allowing you to search through command history based on what you've already typed.

## Features

- **Prefix-based Search**: Search command history based on current input prefix
- **Arrow Key Navigation**: Use up/down arrow keys for intuitive history navigation
- **Cursor Auto-positioning**: Automatically moves cursor to end of line after history navigation
- **Terminal Compatibility**: Works across different terminal emulators with alternative key bindings
- **Zero Dependencies**: Pure ZSH implementation using built-in history functions
- **Lightweight**: Minimal overhead with simple key bindings

## Installation

### Using Sheldon

Add to your `~/.config/sheldon/plugins.toml`:

```toml
[plugins.zsh-history-beginning-search]
github = "kelithius/zsh-history-beginning-search"
```

Or use the command line:

```bash
sheldon add zsh-history-beginning-search --github kelithius/zsh-history-beginning-search
```

### Manual Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/kelithius/zsh-history-beginning-search.git
   ```

2. Source the plugin in your `~/.zshrc`:
   ```bash
   source /path/to/zsh-history-beginning-search/zsh-history-beginning-search.plugin.zsh
   ```

## Usage

Once installed, the plugin automatically enables prefix-based history search:

1. Type the beginning of a command you want to find
2. Press the **up arrow** key to search backwards through matching commands
3. Press the **down arrow** key to search forwards through matching commands
4. Continue pressing arrows to cycle through all matching history entries
5. The cursor automatically moves to the end of the line for easy editing

Example:
```bash
git c<Up>      # Cycles through: git commit, git checkout, git clone, etc.
               # Cursor positioned at end: git commit█
ls -<Up>       # Cycles through: ls -la, ls -l, ls -al, etc.
               # Cursor positioned at end: ls -la█
docker run<Up> # Cycles through all docker run commands
               # Cursor positioned at end: docker run -d nginx█
```

## How It Works

The plugin:
- Creates custom ZLE widgets that combine history search with cursor positioning
- Binds up/down arrow keys to `history-beginning-search-backward-end/forward-end`
- Uses ZSH's built-in `history-beginning-search` and `end-of-line` functions
- Provides alternative key bindings for different terminal emulators
- Searches history based on the current command line prefix
- Automatically moves cursor to end of line after each history navigation

## Key Bindings

| Key | Function |
|-----|----------|
| `↑` (Up Arrow) | Search backwards through history for commands starting with current input |
| `↓` (Down Arrow) | Search forwards through history for commands starting with current input |

## Compatibility

- **ZSH**: 4.3.11 or later
- **Systems**: macOS, Linux, BSD, Windows (WSL)
- **Terminals**: Compatible with most terminal emulators including iTerm2, Terminal.app, GNOME Terminal, etc.

## License

MIT License - see LICENSE file for details.