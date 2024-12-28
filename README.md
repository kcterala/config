### TODOS
- [ ] Write a shell script to create the symbolic links.
- [ ] Add VS code configuration.
- [ ] Add Sublime configuration.
- [ ] Add Ghostty configuration.
- [ ] Add Intellij configuration.
- [ ] Add troubleshooting q/as


# Mac Setup

### 1. Fonts
I really like JetBrains Mono font. I tried so many mono fonts but I keep coming back to this. 

- Download the JetBrains Mono Nerd font from [nerd fonts website](https://www.nerdfonts.com/font-downloads)
- Unzip the folder, select all .ttf files and double click.
- The fonts will be saved to mac's font book, and we can use this anywhere in the system.


### 2. Terminal
Now I have started using [ghostty](https://ghostty.org/), with Arthur Theme. Before this, I used iterm2 with the same theme.
- Ghostty Configuration 
- Iterm2 Configuration
    - Download [Arthur](https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/Arthur.itermcolors) iterm theme, by saving the file (remove .txt extension when saving).
    - Put Background color as `#1c1c1c`
    - Put font as JetBrainsMono Nerd Font


### 3. Shell Integration
Zsh is the Mac's default shell and I'm using the same. I use p10k configuration for the prompt customization

#### Steps to configure .zshrc and .p10k.zsh, once the repo is cloned
- .zshrc Configuration
    - Delete .zshrc file in the home folder.
    - Create symbolic link of this repo's .zshrc to ~/.zshrc by running the following command
    ```
        ln -s [this repo's .zshrc file path] ~/.zshrc
    ```


- .p10k.zsh Configuration 
    - Delete .p10k.zsh file in the home folder.
    - Create symbolic link of this repo's .p10k.zsh to ~/.p10k.zsh by running the following command
    ```
        ln -s [this repo's .p10k.zsh file path] ~/.p10k.zsh
    ```


Run `source ~/.zshrc` once the above steps are done.

