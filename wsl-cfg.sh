#!/bin/bash

# This should be the first thing. I don't like using my password everytime
echo "Copying sudoers"
sudo cp ./sudoers /etc/sudoers

echo "Updating repositories and upgrading installed files"
sudo apt update
sudo apt upgrade

echo "Installing the main programs"
sleep 1
sudo apt install build-essential git curl manpages-dev zip unzip

echo "Configuring git"
git config --global user.email "lucaspaiolla@gmail.com"
git config --global user.name "Lucas Paiolla"
ssh-keygen -t ed25519 -C "lucaspaiolla@gmail.com"

echo "Installing programming languages features"
sleep 1

echo "C/C++"
sleep 1
sudo apt install gcc g++ clang clang-format make
cp ./.clang-format $HOME/

echo "Installing asdf - languages version manager"
sleep 1
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.9.0
source .bashrc

echo "> Installing bat"
sleep 0.5
asdf plugin add bat
asdf install bat latest
asdf install bat latest

echo "> Installing exa"
sleep 0.5
asdf plugin add exa
asdf install exa latest
asdf global exa latest

echo "> Installing fd"
sleep 0.5
asdf plugin add fd
asdf install fd latest
asdf global fd latest

echo "> Installing fzf"
sleep 0.5
asdf plugin add fzf
asdf install fzf latest
asdf global fzf latest

# Installing the latest LTS version of Node (you might change this in future)
echo "> Installing nodejs 16.13.2"
sleep 0.5
asdf plugin add nodejs
asdf install nodejs 16.13.2
asdf global nodejs 16.13.2
npm install -g neovim

# Installing the latest LTS version of Python (you might change this in future)
echo "> Installing python 3.10.2 and 2.7.18"
sleep 0.5
sudo apt install libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
asdf plugin add python
asdf install python 3.10.2
asdf install python 2.7.18
asdf global python 3.10.2 2.7.18

python3 -m ensurepip --upgrade
python2 -m ensurepip --upgrade
pip2 install --upgrade pip
pip3 install --upgrade pip

echo ">> Installing jupyter and its plugins"

echo "Installing zsh and its dependencies"
sleep 1
sudo apt install zsh
cp ./.bashrc $HOME/
cp -r ./zsh-syntax-highlighting $HOME/

echo "> oh-my-zsh"
sleep 1
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cp ./.zshrc $HOME/

echo "> powerlevel10k"
sleep 1
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
cp ./.p10k.zsh $HOME/

echo "> zsh-autosuggestions"
sleep 1
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "> zsh-vi-mode"
sleep 1
git clone https://github.com/jeffreytse/zsh-vi-mode ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-vi-mode

echo "Install nvim and its dependencies"
sudo apt install neovim
sudo apt install xclip ctags
sudo apt install python3-venv
cp ./.vimrc $HOME/
cp -r ./nvim/ $HOME/.config/

echo "> vim-plugin"
sleep 1
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

nvim -c ':PlugInstall'
nvim -c ':CocInstall coc-snippets coc-prettier coc-pairs coc-explorer coc-vimtex coc-texlab coc-sql coc-sh coc-markdownlint coc-jedi'
nvim -c ':CocInstall coc-json coc-clangd coc-fzf-preview coc-tabnine coc-spell-checker coc-highlight coc-cspell-dicts coc-diagnostic'
nvim tmp.c -c ':CocCommand clangd.install'
rm tmp.c

echo "Install tmux and its dependencies"
sudo apt install tmux
cp ./.tmux.conf $HOME/

echo "> tmux plugin manager"
sleep 1
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Installing LaTeX and it's dependences"
sleep 1
sudo apt install latexmk
sudo apt install texlive-base texlive-latex-recommended \
                 texlive texlive-latex-extra texlive-bibtex-extra

echo "> zathura"
sudo apt install zathura

echo "Install neofetch"
sleep 1
sudo apt install neofetch

echo "Set current git repo to SSH"
cat ~/.ssh/id_ed25519.pub | xclip
echo "Please, copy the SSH key into a new key in GitHub (already copied to clipboard)"
read tmpvar
git remote set-url origin git@github.com:Giatroo/cfgs.git
git push -u
