#!/bin/bash

echo "WARNING: This script will remove several packages and their dependencies from your system."
echo "The following packages will be removed:"
echo "  - tmux"
echo "  - python3-venv"
echo "This action cannot be undone. Are you sure you want to proceed? (yes/no)"
read -r confirmation
if [[ "$confirmation" != "yes" ]]; then
  echo "Operation cancelled."
  exit 0
fi

set -x

# Remove apt packages installed by install.sh and pwndbg setup
sudo apt-get remove --purge \
  tmux \
  python3-venv || exit 1

# Clean up any unused dependencies and cached files
sudo apt-get autoremove -y || exit 1
sudo apt-get autoclean || exit 1

echo "All apt dependencies removed successfully."