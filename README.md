# .dotfiles
Config files for 
- Neovim - editor, using 0.5.0 prerelease
- Tmux - terminal multiplexer, I use it when no tilling window manager available, or when SSHing to server
- ZSH - Shell, Bash alternative with great auto completion
- Git - For better viewing commit history
- Xorg - configs for xorg 
- Alacritty - Lightweight terminal emulator
- i3 - Tilling window manager on X
- i3status - Default i3 status bar, switched to polybar
- Polybar - Status bar, used it with i3
- Rofi - app launcher, dmenu alternative, used it with i3
- Sway - i3 but for Wayland
- Waybar - Polybar but for Sway/Wayland

## Chezmoi
Chezmoi should be used with those dotfiles, it is required to add some data in chezmoi config using:
```
chezmoi edit-config
```
Add this
```toml
[data]
  email = "your@email.addr" # Your email address
  name = "your_name"        # Your name for Git
  wayland = false           # True if using Wayland, enables Firefox/Chromium native wayland support
```

## Dependencies
#### Neovim
```
neovim >= 0.5.0 
fzf - fuzzy finder
ripgrep - better dir search
tree-sitter - syntax highlighting
```
#### ZSH
```
exa - ls alternative
zinit - package manager
```

#### Sway
```
pactl
light
wofi
alacritty
waybar

## Verify deps with /usr/share/sway/scripts/grimshot check 
grim
slurp
swaymsg
wl-copy
jq
notify-send
```


### Sway screenshot
![sway-ss](sway.png)
