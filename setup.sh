#!/usr/bin/env bash
# First-time setup for this dotfiles repo. Safe to re-run.

set -euo pipefail

cd "$(dirname "$0")"

case "$(uname -s)" in
    Darwin) OS=macos ;;
    Linux)  OS=linux ;;
    *)      OS=unknown ;;
esac

# --- Check required tools ----------------------------------------------------
required=(git curl stow tmux nvim vim make)
case "$OS" in
    linux) required+=(gcc xclip) ;;
    macos) required+=(cc) ;;
esac

missing=()
for cmd in "${required[@]}"; do
    command -v "$cmd" >/dev/null 2>&1 || missing+=("$cmd")
done

if (( ${#missing[@]} )); then
    echo "Missing commands: ${missing[*]}"
    case "$OS" in
        macos) echo "Install with: brew install ${missing[*]}" ;;
        linux) echo "Install with: sudo apt install ${missing[*]}  (or your distro's equivalent)" ;;
        *)     echo "Install these before continuing." ;;
    esac
    exit 1
fi

# --- Create vim/nvim backup + undo directories -------------------------------
mkdir -p ~/vimtmp/vim/backups ~/vimtmp/nvim/backups ~/vimtmp/nvim/undodir

# --- Initialize tpm submodule ------------------------------------------------
git submodule update --init --recursive

# --- Install vim-plug if missing --------------------------------------------
plug_path="$HOME/.vim/autoload/plug.vim"
if [[ ! -f "$plug_path" ]]; then
    curl -fLo "$plug_path" --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# --- Stow dotfiles into $HOME ------------------------------------------------
# Will error (non-destructively) if a conflicting file already exists in ~.
stow */ -t ~

echo
echo "Setup complete. Next steps:"
echo "  - In tmux: press <prefix> + I to install plugins via tpm."
echo "  - In vim:  run :PlugInstall."
echo "  - In nvim: lazy.nvim bootstraps plugins on first launch."
echo "  - A Nerd Font is required for icons (set.lua sets have_nerd_font=true)."
