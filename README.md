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
  email = "root@gbaranski.com" # Your email address
  name = "gbaranski"           # Your name for Git
  wayland = true               # True if using Wayland, enables Firefox/Chromium native wayland support
```

## Neovim

**I'm using Neovim 0.5.0 with official LSP Support**
```zsh
paru -S neovim-git
```

<h4>Dependencies</h4>
```zsh
fzf     # fuzzy finder
ripgrep # better dir search
```

![neovim-screenshot](neovim.png)

## ZSH
<h4>Dependencies</h4>
```zsh
exa   # ls alternative
zinit # package manager(should be installed automatically)
```

![zsh-screenshot](zsh.png)

## Sway

Wallpaper **must** be present at ~/images/wallpaper.jpg

```zsh
pamixer      # Changing volume
light        # Changing backlight brightness
wofi         # App launcher
alacritty    # Terminal emulator
waybar       # Top bar
python3-ipc  # Python IPC library for Sway/i3
playerctl    # Switching songs
wob          # Nice popup when switching volume/backlight 

## Verify deps with /usr/share/sway/scripts/grimshot check 
grim
slurp
swaymsg
wl-copy
jq
notify-send
```

![sway-ss](sway.png)

![wofi](wofi.png)

