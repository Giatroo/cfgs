#!/bin/bash

# Settings up some colors to use
GREEN='\033[0;32;1m'
BLUE='\033[0;34;1m'
LIGHT_GREEN='\033[1;32m'
LIGHT_BLUE='\033[1;34m'
NOCOLOR='\033[0m'

# This should be the first thing. I don't like using my password everytime
printf "\n${GREEN}- Copying sudoers${NOCOLOR}\n\n"
sudo cp ./sudoers /etc/sudoers

printf "\n${GREEN}- Updating repositories and upgrading installed files${NOCOLOR}\n\n"
sudo apt update
sudo apt upgrade

printf "\n${GREEN}- Installing the main programs${NOCOLOR}\n\n"
sleep 1
sudo apt install build-essential git curl manpages-dev zip unzip


printf "\n${GREEN}- Installing programming languages features${NOCOLOR}\n\n"
sleep 1

printf "\n${BLUE}> C/C++${NOCOLOR}\n"
sleep 1
sudo apt install gcc g++ clang clang-format make
cp ./.clang-format $HOME/

printf "\n${LIGHT_GREEN}- Installing asdf - languages version manager${NOCOLOR}\n"
sleep 1
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.9.0
source .bashrc

printf "\n${LIGHT_BLUE}> Installing bat${NOCOLOR}\n"
sleep 0.5
asdf plugin add bat
asdf install bat latest
asdf install bat latest

printf "\n${LIGHT_BLUE}> Installing exa${NOCOLOR}\n"
sleep 0.5
asdf plugin add exa
asdf install exa latest
asdf global exa latest

printf "\n${LIGHT_BLUE}> Installing fd${NOCOLOR}\n"
sleep 0.5
asdf plugin add fd
asdf install fd latest
asdf global fd latest

printf "\n${LIGHT_BLUE}> Installing fzf${NOCOLOR}\n"
sleep 0.5
asdf plugin add fzf
asdf install fzf latest
asdf global fzf latest

# Installing the latest LTS version of Node (you might change this in future)
printf "\n${LIGHT_BLUE}> Installing nodejs 16.13.2${NOCOLOR}\n"
sleep 0.5
asdf plugin add nodejs
asdf install nodejs 16.13.2
asdf global nodejs 16.13.2
npm install -g neovim

# Installing the latest LTS version of Python (you might change this in future)
printf "\n${LIGHT_BLUE}> Installing python 3.10.2 and 2.7.18${NOCOLOR}\n"
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
pip2 install wheel
pip3 install wheel
pip2 install pynvim
pip3 install pynvim
pip3 install -r ./requirements.txt

printf "\n${GREEN}- Installing zsh and its dependencies${NOCOLOR}\n\n"
sleep 1
sudo apt install zsh
cp ./.bashrc $HOME/
cp -r ./zsh-syntax-highlighting $HOME/

printf "\n${BLUE}> oh-my-zsh${NOCOLOR}\n"
sleep 1
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cp ./.zshrc $HOME/

printf "\n${BLUE}> powerlevel10k${NOCOLOR}\n"
sleep 1
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
cp ./.p10k.zsh $HOME/

printf "\n${BLUE}> zsh-autosuggestions${NOCOLOR}\n"
sleep 1
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

printf "\n${BLUE}> zsh-vi-mode${NOCOLOR}\n"
sleep 1
git clone https://github.com/jeffreytse/zsh-vi-mode ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-vi-mode

printf "\n${GREEN}- Install nvim and its dependencies${NOCOLOR}\n\n"
sudo apt install neovim
sudo apt install xclip ctags
sudo apt install python3-venv
cp ./.vimrc $HOME/
cp -r ./nvim/ $HOME/.config/

printf "\n${BLUE}> vim-plugin${NOCOLOR}\n"
sleep 1
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

nvim -c ':PlugInstall'
nvim -c ':CocInstall coc-snippets coc-prettier coc-pairs coc-explorer coc-vimtex coc-texlab coc-sql coc-sh coc-markdownlint coc-jedi'
nvim -c ':CocInstall coc-json coc-clangd coc-fzf-preview coc-tabnine coc-spell-checker coc-highlight coc-cspell-dicts coc-diagnostic'
nvim tmp.c -c ':CocCommand clangd.install'
rm tmp.c

printf "\n${GREEN}- Installing tmux and its dependencies${NOCOLOR}\n\n"
sudo apt install tmux
cp ./.tmux.conf $HOME/

printf "\n${BLUE}> tmux plugin manager${NOCOLOR}\n"
sleep 1
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

printf "\n${GREEN}- Installing LaTeX and its dependencies${NOCOLOR}\n\n"
sleep 1
sudo apt install latexmk
sudo apt install texlive-base texlive-latex-recommended \
                 texlive texlive-latex-extra texlive-bibtex-extra

printf "\n${BLUE}> zathura${NOCOLOR}\n"
sudo apt install zathura xdotool

printf "\n${GREEN}- Installing neofetch${NOCOLOR}\n\n"
sleep 1
sudo apt install neofetch

printf "\n${GREEN}- Configuring git${NOCOLOR}\n\n"
git config --global user.email "lucaspaiolla@gmail.com"
git config --global user.name "Lucas Paiolla"
ssh-keygen -t ed25519 -C "lucaspaiolla@gmail.com"

printf "\n${LIGHT_BLUE}Set current git repo to SSH${NOCOLOR}\n"
cat ~/.ssh/id_ed25519.pub | xclip
printf "\n${LIGHT_BLUE}Please, copy the SSH key into a new key in GitHub. It's already copied to clipboard${NOCOLOR}\n"
read tmpvar
git remote set-url origin git@github.com:Giatroo/cfgs.git
git push -u
