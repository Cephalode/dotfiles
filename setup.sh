#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$(realpath "$0")")"

# Shared packages (all platforms)
shared="gtk-3 gtk-4 zshrc alacritty ghostty noctalia qt5ct qt6ct kdeglobals dconf zellij nix ssh kanata keyd"

# Remove broken symlinks in $HOME and ~/.config before stowing
find "$HOME" -maxdepth 3 -xtype l -delete 2>/dev/null || true

# Platform-specific packages
# karabiner is kept in the repo but not stowed: the live file is owned by the nix module.
case "$(uname -s)" in
  Darwin)
    stow --target="$HOME" $shared aerospace hammerspoon skhd sketchybar kindavim
    ;;
  Linux)
    stow --target="$HOME" $shared
    ;;
  *)
    echo "Unknown OS: $(uname -s)"
    exit 1
    ;;
esac
