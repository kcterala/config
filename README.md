### TODOS
- [x] Add VS code configuration.
- [x] Add Sublime configuration.
- [x] Add macOS system preferences script.
- [ ] Add Ghostty configuration.
- [ ] Add Iterm2 configuration.
- [ ] Add Intellij configuration.
- [ ] Add troubleshooting q/as.


# Mac Setup

### Fonts
I really like JetBrains Mono font. I tried so many mono fonts but I keep coming back to this. 

- Download the JetBrains Mono Nerd font from [nerd fonts website](https://www.nerdfonts.com/font-downloads)
- Unzip the folder, select all .ttf files and double click.
- The fonts will be saved to mac's font book, and we can use this anywhere in the system.


### Terminal
Now I have started using [ghostty](https://ghostty.org/), with Arthur Theme. Before this, I used iterm2 with the same theme.
- Ghostty Configuration 
- Iterm2 Configuration
    - Download [Arthur](https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/Arthur.itermcolors) iterm theme, by saving the file (remove .txt extension when saving).
    - Put Background color as `#1c1c1c`
    - Put font as JetBrainsMono Nerd Font

### Apps to download
- Sublime text
- Intellij
- VS code
- iterm2 / Ghostty
- Obsidian
- Brave


### Update configurations

Once the apps are downloaded, use [GNU Stow](https://www.gnu.org/software/stow/) to manage your dotfiles. Stow is a symlink farm manager that makes it easy to manage configuration files.

1. Install Stow:
   ```bash
   brew install stow
   ```

2. Navigate to the config directory:
   ```bash
   cd ~/Developer/config
   ```

3. Use Stow to create symlinks for each configuration:
   ```bash
   stow terminal
   stow git
   stow vscode
   stow sublime-text
   stow ssh
   ```

   Or stow everything at once:
   ```bash
   stow */
   ```

4. To remove symlinks if needed:
   ```bash
   stow -D terminal  # Removes terminal symlinks
   ```

After setting up symlinks, restart applications or source the terminal config as needed.

### macOS System Preferences

To apply macOS system preferences (Dock, Finder, trackpad, etc.), run the `.macos` script:

```bash
cd ~/Developer/config/macos
./.macos
```

This script configures:
- **Dock**: Auto-hide with instant show, magnification, hot corners
- **Finder**: Desktop icons, sidebar visibility
- **UI/UX**: Dark mode, window behavior, spring loading
- **Trackpad**: Tap to click enabled
- **Screenshots**: Save to clipboard by default
- **Menu Bar Clock**: Show day of week and AM/PM
- **Keyboard Shortcuts**: Disable conflicting shortcuts

Note: This only needs to be run once per machine or when you want to reapply settings. Some changes may require logout/restart to take full effect.


