#!/bin/bash
set -x

echo "WARNING: This script will remove several packages and their dependencies from your system."
echo "The following packages will be removed:"
echo "  - git"
echo "  - python-is-python3"
echo "  - tmux"
echo "  - python3-venv"
echo "  - gcc"
echo "  - gdb"
echo "  - gdbserver"
echo "  - python3-dev"
echo "  - python3-setuptools"
echo "  - libglib2.0-dev"
echo "  - libc6-dbg"
echo "  - curl"
echo "  - libc6-dbg:i386"
echo "  - libgcc-s1:i386"
echo "This action cannot be undone. Are you sure you want to proceed? (yes/no)"
read -r confirmation
if [[ "$confirmation" != "yes" ]]; then
  echo "Operation cancelled."
  exit 0
fi

# Remove apt packages installed by install.sh and pwndbg setup
sudo apt-get remove --purge -y \
  git \
  python-is-python3 \
  tmux \
  python3-venv \
  gcc \
  gdb \
  gdbserver \
  python3-dev \
  python3-setuptools \
  libglib2.0-dev \
  libc6-dbg \
  curl \
  libc6-dbg:i386 \
  libgcc-s1:i386 || exit 1

# Clean up any unused dependencies and cached files
sudo apt-get autoremove -y || exit 1
sudo apt-get autoclean || exit 1

echo "All apt dependencies removed successfully."