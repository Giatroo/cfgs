#!/bin/bash

# Settings up some colors to use
GREEN='\033[0;32;1m'
BLUE='\033[0;34;1m'
LIGHT_GREEN='\033[1;32m'
LIGHT_BLUE='\033[1;34m'
NOCOLOR='\033[0m'


# This should be the first thing. I don't like using my password every time
printf "\n${GREEN}- Copying sudoers${NOCOLOR}\n\n"
sudo cp ./sudoers /etc/sudoers


printf "\n${GREEN}- Updating repositories and upgrading installed files${NOCOLOR}\n\n"
sudo apt update
sudo apt upgrade


printf "\n${GREEN}- Installing the main programs${NOCOLOR}\n\n"
sleep 1
sudo apt install git curl wget zip unzip tar


printf "\n${GREEN}- Installing programming languages features${NOCOLOR}\n\n"
sleep 1

printf "\n${GREEN}- Installing Golang 1.24.1${NOCOLOR}\n\n"
sleep 1
wget https://dl.google.com/go/go1.24.1.linux-amd64.tar.gz
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf go1.24.1.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin

printf "\n${LIGHT_GREEN}- Installing asdf - languages version manager${NOCOLOR}\n"
sleep 1
go install github.com/asdf-vm/asdf/cmd/asdf@v0.16.5

printf "\n${LIGHT_BLUE}> Installing bat${NOCOLOR}\n"
sleep 0.5
asdf plugin add bat
asdf install bat latest
asdf set -u bat latest

printf "\n${LIGHT_BLUE}> Installing exa${NOCOLOR}\n"
sleep 0.5
asdf plugin add exa
asdf install exa latest
asdf set -u exa latest

printf "\n${LIGHT_BLUE}> Installing fd${NOCOLOR}\n"
sleep 0.5
asdf plugin add fd
asdf install fd latest
asdf set -u fd latest

printf "\n${LIGHT_BLUE}> Installing bottom${NOCOLOR}\n"
sleep 0.5
asdf plugin add bottom
asdf install bottom latest
asdf set -u bottom latest

printf "\n${LIGHT_BLUE}> Installing fzf${NOCOLOR}\n"
sleep 0.5
asdf plugin add fzf
asdf install fzf latest
asdf set -u fzf latest

printf "\n${LIGHT_BLUE}> Installing nodejs${NOCOLOR}\n"
sleep 0.5
asdf plugin add nodejs
asdf install nodejs latest
asdf set -u nodejs latest
npm install -g neovim

# Installing the latest LTS version of Python (you might change this in future)
printf "\n${LIGHT_BLUE}> Installing python 3.12.7 and 2.7.18${NOCOLOR}\n"
sleep 0.5
sudo apt install libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
asdf plugin add python
asdf install python 3.13.1
asdf install python 2.7.18
asdf set -u python 3.13.1 2.7.18

python3 -m ensurepip --upgrade
python2 -m ensurepip --upgrade
pip2 install --upgrade pip
pip3 install --upgrade pip
pip2 install wheel
pip3 install wheel
pip2 install pynvim
pip3 install pynvim

printf "\n${GREEN}- Installing zsh and its dependencies${NOCOLOR}\n\n"
sleep 1
sudo apt install zsh
cp -r ./zsh-syntax-highlighting $HOME/

printf "\n${BLUE}> oh-my-zsh${NOCOLOR}\n"
sleep 1
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cp ./.zshrc $HOME/
cp ./.zshrc_aliases $HOME/

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

printf "\n${BLUE}> zsh-syntax-highlighting${NOCOLOR}\n"
sleep 1
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/

printf "\n${BLUE}> zsh-wakatime${NOCOLOR}\n"
sleep 1
git clone https://github.com/wbingli/zsh-wakatime.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-wakatime

printf "\n${BLUE}> fzf-tab${NOCOLOR}\n"
sleep 1
git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab

printf "\n${GREEN}- Install nvim and its dependencies${NOCOLOR}\n\n"
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt install neovim
sudo apt install xclip ripgrep luarocks
sudo apt install python3-venv python3-pip
sudo luarocks install jsregexp
cp -r ./nvim/ $HOME/.config/

# Also installing old vim:
# cp ./.vimrc $HOME/
# curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

printf "\n${GREEN}- Installing tmux and its dependencies${NOCOLOR}\n\n"
sudo apt install tmux
cp ./.tmux.conf $HOME/

printf "\n${BLUE}> tmux plugin manager${NOCOLOR}\n"
sleep 1
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

#printf "\n${GREEN}- Installing LaTeX and its dependencies${NOCOLOR}\n\n"
#sleep 1
#sudo apt install latexmk
#sudo apt install texlive-base texlive-latex-recommended texlive texlive-latex-extra texlive-bibtex-extra

#printf "\n${BLUE}> zathura${NOCOLOR}\n"
#sudo apt install zathura xdotool
#mkdir $HOME/.config/zathura/
#cp ./zathurarc $HOME/.config/zathura/

printf "\n${GREEN}- Installing neofetch${NOCOLOR}\n\n"
sleep 1
sudo apt install neofetch

printf "\n${GREEN}- Configuring git${NOCOLOR}\n\n"
git config --global user.email "lucaspaiolla@gmail.com"
git config --global user.name "Lucas Paiolla"
