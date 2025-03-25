#!/bin/bash
set -x

# Remove the virtual environment
if [ -d "~/pwn" ]; then
  rm -rf ~/pwn
  echo "Removed virtual environment 'pwn'."
else
  echo "Virtual environment 'pwn' not found. Skipping."
fi

# Remove oh my tmux
if [ -d "~/.tmux" ]; then
  rm -rf ~/.tmux
  echo "Removed '.tmux' directory."
else
  echo "'.tmux' directory not found. Skipping."
fi

if [ -f "~/.tmux.conf" ]; then
  rm -f ~/.tmux.conf
  echo "Removed '.tmux.conf' symlink."
else
  echo "'.tmux.conf' symlink not found. Skipping."
fi

if [ -f "~/.tmux.conf.local" ]; then
  rm -f ~/.tmux.conf.local
  echo "Removed '.tmux.conf.local'."
else
  echo "'.tmux.conf.local' not found. Skipping."
fi

# Remove pwndbg
if [ -d "~/pwndbg" ]; then
  rm -rf ~/pwndbg
  echo "Removed 'pwndbg' directory."
else
  echo "'pwndbg' directory not found. Skipping."
fi

# Remove nvim
if [ -d "/opt/nvim-linux-x86_64" ]; then
  sudo rm -rf /opt/nvim-linux-x86_64
  echo "Removed Neovim installation."
else
  echo "Neovim installation not found. Skipping."
fi

if [ -d "~/.config/nvim" ]; then
  rm -rf ~/.config/nvim
  echo "Removed Neovim configuration."
else
  echo "Neovim configuration not found. Skipping."
fi

# Remove PATH modification for Neovim
if grep -q '/opt/nvim-linux-x86_64/bin' ~/.bashrc; then
  sed -i '/\/opt\/nvim-linux-x86_64\/bin/d' ~/.bashrc
  echo "Removed Neovim PATH modification from .bashrc."
else
  echo "Neovim PATH modification not found in .bashrc. Skipping."
fi

echo "Uninstall completed. Please run 'source ~/.bashrc' to apply the changes."