#!/bin/bash
set -x

# Remove apt packages installed by install.sh
sudo apt-get remove --purge -y \
  git \
  python-is-python3 \
  tmux \
  python3-venv \
  gcc || exit 1

# Clean up any unused dependencies and cached files
sudo apt-get autoremove -y || exit 1
sudo apt-get autoclean || exit 1

echo "All apt dependencies removed successfully."