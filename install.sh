#!/bin/bash
set -x

sudo apt-get update || exit 1

sudo apt-get install git -y || exit 1

git clone https://github.com/CsomePro/easy-pwn-env.git || exit 1

sudo apt-get install -y \
  python-is-python3 \
  tmux \
  python3.12-venv ||
  exit 1

# save current path
DIR=$(pwd)

# install oh my tmux
cd ~
git clone --single-branch https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
# cp .tmux/.tmux.conf.local .

# use self local config
cp ./easy-pwn-env/.tmux.conf.local ~/

# build the venv
cd ~
python3 -m venv pwn
source pwn/bin/activate
# check if pip is from the virtual environment
if pip -V | grep -q "$(pwd)/pwn"; then
  echo "pip is correctly set to the virtual environment."
else
  echo "Error: pip is not using the virtual environment." >&2
  exit 1
fi

# install pwntools
pip install pwntools

# install pwndbg
cd ~
git clone https://github.com/pwndbg/pwndbg
cd pwndbg
./setup.sh

# install nvim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
echo 'export PATH="$PATH:/opt/nvim-linux-x86_64/bin"' >>~/.bashrc
source ~/.bashrc

# install lazyvim
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

# use self lazyvim option.lua
cp ./easy-pwn-env/option.lua ~/.config/nvim/lua/config/options.lua

echo "Install Succeed!. Please run 'source ~/.bashrc' to apply the changes."
