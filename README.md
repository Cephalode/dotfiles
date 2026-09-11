# Dotfiles

GNU Stow-managed config files for both macOS (Metasepia) and NixOS (Loligo).

## Install

```bash
cd ~/dev/dotfiles
./setup.sh
```

Or manually:
```bash
stow --target="$HOME" zshrc ghostty gtk-3 gtk-4 kanata keyd  # etc, see setup.sh
```

## Structure

Each package lives in its own directory with the structure that should appear in `~/.config/`:

- `zshrc/` — Zsh config (`~/.config/zsh`)
- `alacritty/`, `ghostty/`, `zellij/` — Terminals and multiplexer
- `kanata/`, `keyd/` — Keyboard configuration
- `gtk-3/`, `gtk-4/`, `qt5ct/`, `qt6ct/`, `kdeglobals/`, `dconf/`, `noctalia/` — Theming
- `nix/`, `ssh/` — Misc
- macOS only: `aerospace/`, `hammerspoon/`, `skhd/`, `sketchybar/`, `kindavim/`
- `karabiner/` is kept for reference but not stowed; the nix module owns the live file
- git, kitty, cava, fuzzel, atuin, niri moved to nix wrapper modules

## Update a package

```bash
# Edit files in ~/.config/zsh (or wherever)
# Changes are automatically reflected in ~/dev/dotfiles/zshrc/.config/zsh/
cd ~/dev/dotfiles
git add .
git commit -m "Update zsh"
```
