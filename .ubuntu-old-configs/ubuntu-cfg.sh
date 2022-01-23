#!/bin/bash

# Copying dotfiles to their locations
echo Copying dotfiles to their locations
pushd ~
cp ~/.config/user/.zshrc ~/
cp ~/.config/user/.vimrc ~/
cp ~/.config/user/.bashrc ~/
cp ~/.config/user/.clang-format ~/
cp ~/.config/user/.tmux.conf ~/
cp ~/.config/user/.p10k.zsh ~/
mkdir ~/.config/zathura
cp ~/.config/user/zathurarc ~/.config/zathura/
cp -r ~/.config/user/zsh-syntax-highlighting ~/
cp -r ~/.config/user/nvim ~/.config/

echo Installing main programs
sudo apt install arc-theme build-essential gnome-tweaks git curl npm nodejs

echo Installing terminal programs
sudo apt install zsh neovim tmux vim-gtk3 fonts-powerline

echo Installing programming languages features
sudo apt install gcc g++ clang clang-format python3 octave valgrind latexmk wakatime

echo Installing python things
sudo apt install python3-pip

sudo apt-get install libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6

pip install jupyter-kite
jupyter labextension install "@kiteco/jupyterlab-kite"

mkdir -p $(jupyter --data-dir)/nbextensions
pushd $(jupyter --data-dir)/nbextensions
git clone https://github.com/lambdalisue/jupyter-vim-binding vim_binding
jupyter nbextension enable vim_binding/vim_binding
popd

pip3 install jupyter-tabnine --user
jupyter nbextension install --py jupyter_tabnine --user
jupyter nbextension enable --py jupyter_tabnine --user
jupyter serverextension enable --py jupyter_tabnine --user


# one dark theme for jupyter
#pushd ~
#git clone https://github.com/deryrahman/jupyter-notebook-one-dark-theme.git
#cd jupyter-notebook-one-dark-theme
#cp custom.css ~/.jupyter/custom/custom.css
#pip install jupyterthemes
#cp startup.py ~/.ipython/profile_default/startup/startup.py
#jt -t onedork -fs 95 -altp -tfs 11 -nfs 115 -cellw 88% -T
#popd

echo Installing zathura
sudo apt-get install zathura zathura-cb zathura-ps zathura-djvu

echo Installing miktex
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D6BC243565B2087BC3F897C9277A7293F59E4889
echo "deb http://miktex.org/download/ubuntu focal universe" | sudo tee /etc/apt/sources.list.d/miktex.list
sudo apt-get update
sudo apt-get install miktex

echo Installing onedark theme for terminal
bash -c "$(curl -fsSL https://raw.githubusercontent.com/denysdovhan/gnome-terminal-one/master/one-dark.sh)"

echo Installing vim-plugin
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo Installing nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.1/install.sh | bash

echo Installing oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#chsh -s $(which zsh)

echo Installing wakatime
pip install wakatime
git clone https://github.com/sobolevn/wakatime-zsh-plugin.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/wakatime

echo Installing powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

echo Installing zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo Installing tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo Installing python nvim support
pip3 install pynvim

echo "Installing bottom (better version of top)"
curl -LO https://github.com/ClementTsang/bottom/releases/download/0.5.6/bottom_0.5.6_amd64.deb
sudo dpkg -i bottom_0.5.6_amd64.deb

popd

echo "Don't forget to click <C-a><S-i> to install tmux plugins"
echo Also make sure to restart your computer to apply all changes
echo "Unfortunately, you must install Anaconda manually (after that, rerun this script)"
