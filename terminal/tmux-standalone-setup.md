# Tmux Configuration - Vesper Theme

Single-file tmux setup with Vesper colors. No dependencies.

## Setup (New Machine)

### 1. Stow the dotfiles
```bash
cd ~/Developer/config
stow terminal
```

This creates:
- `~/.tmux.conf` → `~/Developer/config/terminal/.tmux.conf`
- `~/.zshrc` → `~/Developer/config/terminal/.zshrc`
- `~/.zsh/` → `~/Developer/config/terminal/.zsh/`

### 2. Install fzf (for project finder)
```bash
brew install fzf
```

### 3. Start tmux
```bash
tmux
```

---

## Keybindings

**Prefix:** `Ctrl+a`

### Splits
| Key | Action |
|-----|--------|
| `prefix + \|` | Split horizontal (side-by-side) |
| `prefix + -` | Split vertical (stacked) |

### Pane Navigation
| Key | Action |
|-----|--------|
| `prefix + h/j/k/l` | Vim-style navigation |
| `prefix + [` | Previous pane |
| `prefix + ]` | Next pane |
| `prefix + H/J/K/L` | Resize pane |
| `prefix + z` | Toggle zoom |
| `prefix + x` | Kill pane |

### Windows
| Key | Action |
|-----|--------|
| `prefix + c` | New window |
| `prefix + 1-9` | Jump to window |
| `prefix + n/p` | Next/previous window |
| `prefix + ,` | Rename window |
| `prefix + X` | Kill window |
| `prefix + o` | Open project picker |

### Sessions
| Key | Action |
|-----|--------|
| `prefix + d` | Detach |
| `prefix + s` | List sessions |
| `prefix + $` | Rename session |

### Other
| Key | Action |
|-----|--------|
| `prefix + r` | Reload config |
| `prefix + ?` | Show all keybindings |

---

## Terminal Commands

```bash
tmux                    # Start new session
tmux new -s name        # Start named session
tmux ls                 # List sessions
tmux attach             # Attach to last session
tmux attach -t name     # Attach to named session
tmux kill-session -t x  # Kill session
```

---

## Color Palette (Vesper)

| Color | Hex | Usage |
|-------|-----|-------|
| bg | #101010 | Background |
| accent | #FFC799 | Orange (session name, active window) |
| mint | #99FFE4 | Cyan (SSH indicator) |
| fg | #FFFFFF | White (inactive windows) |
| fg_muted | #A0A0A0 | Gray (status text) |
| fg_dim | #5C5C5C | Dark gray (separators) |
