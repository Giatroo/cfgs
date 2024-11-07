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
sudo apt install git curl manpages-dev zip unzip


printf "\n${GREEN}- Installing programming languages features${NOCOLOR}\n\n"
sleep 1

printf "\n${BLUE}> C/C++${NOCOLOR}\n"
sleep 1
sudo apt install gcc g++ clang-format make
cp ./.clang-format $HOME/

printf "\n${LIGHT_GREEN}- Installing asdf - languages version manager${NOCOLOR}\n"
sleep 1
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.1
. $HOME/.asdf/asdf.sh
alias asdf="$HOME/.asdf/bin/asdf"

printf "\n${LIGHT_BLUE}> Installing bat${NOCOLOR}\n"
sleep 0.5
asdf plugin add bat
asdf install bat latest
asdf global bat latest

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

printf "\n${LIGHT_BLUE}> Installing bottom${NOCOLOR}\n"
sleep 0.5
asdf plugin add bottom
asdf install bottom latest
asdf global bottom latest

printf "\n${LIGHT_BLUE}> Installing fzf${NOCOLOR}\n"
sleep 0.5
asdf plugin add fzf
asdf install fzf latest
asdf global fzf latest

printf "\n${LIGHT_BLUE}> Installing nodejs${NOCOLOR}\n"
sleep 0.5
asdf plugin add nodejs
asdf install nodejs latest
asdf global nodejs latest
npm install -g neovim

# Installing the latest LTS version of Python (you might change this in future)
printf "\n${LIGHT_BLUE}> Installing python 3.12.7 and 2.7.18${NOCOLOR}\n"
sleep 0.5
sudo apt install libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
asdf plugin add python
asdf install python 3.12.7
asdf install python 2.7.18
asdf global python 3.12.7 2.7.18

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
cp ./.vimrc $HOME/
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

printf "\n${GREEN}- Enabling ForwardX11${NOCOLOR}\n\n"
sudo echo "    ForwardX11 yes" >> $HOME/.ssh/config
sudo echo "    ForwardX11Trusted yes" >> $HOME/.ssh/config
sudo echo "    ForwardX11 yes" >> /etc/ssh/ssh_config
sudo echo "    ForwardX11Trusted yes" >> /etc/ssh/ssh_config

printf "\n${GREEN}- Installing tmux and its dependencies${NOCOLOR}\n\n"
sudo apt install tmux
cp ./.tmux.conf $HOME/

printf "\n${BLUE}> tmux plugin manager${NOCOLOR}\n"
sleep 1
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

printf "\n${GREEN}- Installing LaTeX and its dependencies${NOCOLOR}\n\n"
sleep 1
sudo apt install latexmk
sudo apt install texlive-base texlive-latex-recommended texlive texlive-latex-extra texlive-bibtex-extra

printf "\n${BLUE}> zathura${NOCOLOR}\n"
sudo apt install zathura xdotool
mkdir $HOME/.config/zathura/
cp ./zathurarc $HOME/.config/zathura/

# https://medium.com/@ali.abulhawa/installing-tensorflow-2-16-gpu-on-windows-wsl2-df73ac3446c9
# Note that this is for tensorflow-2.16 and python 3.11.9
# This might change in future versions and is always a pain in the ass
#printf "\n${GREEN}- Installing CUDA for TensorFlow\n\n"
#sleep 1
#wget https://developer.download.nvidia.com/compute/cuda/repos/wsl-ubuntu/x86_64/cuda-wsl-ubuntu.pin
#sudo mv cuda-wsl-ubuntu.pin /etc/apt/preferences.d/cuda-repository-pin-600
#wget https://developer.download.nvidia.com/compute/cuda/12.3.0/local_installers/cuda-repo-wsl-ubuntu-12-3-local_12.3.0-1_amd64.deb
#sudo dpkg -i cuda-repo-wsl-ubuntu-12-3-local_12.3.0-1_amd64.deb
#sudo cp /var/cuda-repo-wsl-ubuntu-12-3-local/cuda-*-keyring.gpg /usr/share/keyrings/
#sudo apt-get update
#sudo apt-get -y install cuda-toolkit-12-3
#rm cuda-repo-wsl-ubuntu-12-3-local_12-3-local_12.3.0-1_amd64.deb

# WARNING! This will fail if you don't get the deb file before running the
# script
#printf "\n${GREEN}- Installing cuDNN for TensorFlow\n\n"
#sleep 1
#sudo dpkg -i cudnn-local-repo-ubuntu2204-8.9.7.29_1.0-1_amd64.deb
#sudo cp /var/cudnn-local-repo-ubuntu2204-8.9.7.29/cudnn-local-08A7D361-keyring.gpg /usr/share/keyrings/
#sudo apt-get update
#sudo apt-get install libcudnn8=8.9.7.29-1+cuda12.2

printf "\n${GREEN}- Installing neofetch${NOCOLOR}\n\n"
sleep 1
sudo apt install neofetch

printf "\n${GREEN}- Configuring git${NOCOLOR}\n\n"
git config --global user.email "lucaspaiolla@gmail.com"
git config --global user.name "Lucas Paiolla"
