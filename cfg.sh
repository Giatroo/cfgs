#!/bin/bash

pushd ~
cp ~/.config/user/.zshrc ~/
cp ~/.config/user/.vimrc ~/
cp ~/.config/user/.bashrc ~/
cp ~/.config/user/.clang-format ~/
cp ~/.config/user/.tmux.conf ~/
mkdir ~/.config/zathura
cp ~/.config/user/zathurarc ~/.config/
cp -r ~/.config/user/zsh-syntax-highlighting ~/
cp -r ~/.config/user/nvim ~/.config/
popd
