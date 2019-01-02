#!/usr/bin/env bash

# Prepare Homebrew

brew update
brew tap Homebrew/bundle
brew bundle
brew install ccache

# Install Icarus Verilog

mkdir -p ~/.local-src
mkdir -p ~/.local-bin
cd ~/.local-src
git clone git://github.com/steveicarus/iverilog.git
cd iverilog
autoconf
./configure --prefix=$HOME/.local-bin
make -j 4
make install

# Configure new PATH

cat >>$HOME/.bash_profile <<'EOF'
export PATH="/usr/local/opt/ccache/libexec:$HOME/.local-bin/bin:$PATH"
EOF