#!/bin/bash

# Updating the system to the latest version
sudo pacman -Syu

# Installing base-devel group + other essencial programs
sudo pacman -S --needed base-devel man unzip

# Updating the sudoers file
sudo cp $HOME/.config/user/sudoers /etc/sudoers

# Installing VirtualBox packages
# (don't install it if you are not on virtualbox)
sudo pacman -S --needed virtualbox-guest-utils

# Enabling the VirtualBox service
# (don't enable it if you are not on virtualbox
sudo systemctl enable vboxservice.service

# Installing xorg (the graphical server)
sudo pacman -S --needed xorg-server

# Installing the display manager and the window tiling manager
sudo pacman -S --needed i3-gaps lightdm lightdm-webkit2-greeter rofi picom

# Installing lightdm greeters
sudo git clone https://github.com/paysonwallach/aqua-lightdm-webkit-theme /usr/share/lightdm-webkit/themes/aqua
sudo git clone https://github.com/NoiSek/Aether.git /usr/share/lightdm-webkit/themes/Aether
sudo pacman -S --needed lightdm-webkit-theme-litarvan

# Copying wallpapers
sudo cp -r $HOME/.config/user/user_backgrounds/ /usr/share/backgrounds
sudo cp /usr/share/backgrounds/user_backgrounds/default_wallpaper.jpg /usr/share/backgrounds/current

# Copying lightdm configuration file to the destination
sudo cp -r $HOME/.config/user/lightdm/ /etc/lightdm/

# Copying picom configuration over to the destination folder
mkdir $HOME/.config/picom
cp $HOME/.config/user/picom.conf $HOME/.config/picom/

# Copying i3 configuration over to the destination folder
mkdir $HOME/.config/i3
sudo cp $HOME/.config/user/i3config $HOME/.config/i3/config

# Enabling lightdm
sudo systemctl enable lightdm

# Installing powerline fonts for terminal
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

# Installing yay
cd /opt
sudo git clone https://aur.archlinux.org/yay-git.git
sudo chown -R giatro:giatro ./yay-git
cd yay-git
makepkg -si
cd $HOME/.config/user

# Installing Alacritty terminal emulator
sudo pacman -S --needed alacritty

# Copying alacritty configuration over to the destination folder
mkdir $HOME/.config/alacritty
cp $HOME/.config/user/alacritty.yml $HOME/.config/alacritty/

# Installing nitrogen
sudo pacman -S --needed nitrogen

# Install polybar
yay -S --needed polybar

# Installing polybar theme dependencies
sudo pacman -S --needed playerctl
yay -S --needed zscroll

# Installing polybar fonts (later I need to make sure this is needed)
sudo pacman -S --needed xorg-fonts-misc
yay -S --needed siji-git ttf-unifont

# Copying polybar configuration over to the destination folder
mkdir $HOME/.config/polybar
cp -r $HOME/.config/user/polybar $HOME/.config/

# Installing main fonts
sudo pacman -S --needed ttf-dejavu gnu-free-fonts ttf-liberation noto-fonts

# Installing the main workflow programs
sudo pacman -S --needed zsh neovim tmux gvim curl npm nodejs

# Installing the main programming languages
sudo pacman -S --needed gcc clang python python3 python-pip valgrind wakatime

# Copying the dotfiles to their locations
cp $HOME/.config/user/.vimrc $HOME/
cp $HOME/.config/user/.bashrc $HOME/
cp $HOME/.config/user/.clang-format $HOME/
cp $HOME/.config/user/.tmux.conf $HOME/
cp $HOME/.config/user/.p10k.zsh $HOME/
cp -r $HOME/.config/user/nvim $HOME/.config/
cp $HOME/.config/user/.xprofile $HOME/
cp -r $HOME/.config/user/rofi $HOME/.config/

# Installing adi1090x rofi's fonts
git clone https://github.com/adi1090x/rofi temp
cd temp
cp -r ./fonts/* $HOME/.local/share/fonts/
cd ..
rm -rf temp
fc-cache -f

# Installing zathura
# sudo pacman -S --needed zathura zathura-cb zathura-ps zathura-djvu
sudo pacman -S --needed zathura zathura-pdf-mupdf

# Copying zathura configs to their destination
mkdir $HOME/.config/zathura
cp $HOME/.config/user/zathurarc $HOME/.config/zathura/

# Installing vim-plugin
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Installing all my plugins
nvim -c ':PlugInstall'
nvim -c ':CocInstall coc-snippets coc-prettier coc-pairs coc-explorer coc-vimtex coc-tsserver coc-texlab coc-sql coc-sh coc-rome coc-markdownlint coc-jedi'
nvim -c ':CocInstall coc-json coc-html coc-css coc-clangd coc-fzf-preview coc-tabnine coc-spell-checker coc-highlight coc-cspell-dicts coc-diagnostic'
nvim -c ':CocCommand clangd.install'
sudo pacman -S --needed universal-ctags # used by tagbar
sudo pacman -S --needed xclip # clipboard tool
sudo npm install -g neovim # node provider
pip install unidecode # used latex snippets
pip install jedi-jedi-language-server pylint # used by coc-jedi

# Installing latex
sudo pacman -S --needed texlive-most texlive-bibtexextra
# sudo pacman -S --needed biber

# Installing oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cp $HOME/.config/user/.zshrc $HOME/
cp -r $HOME/.config/user/zsh-syntax-highlighting $HOME/

# Installing powerlevel 10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
# You might need to install the fonts on
# https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k
# to enable the custom icons.

# Installing zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Installing zsh-vi-mode
git clone https://github.com/jeffreytse/zsh-vi-mode \
  $HOME/.oh-my-zsh/custom/plugins/zsh-vi-mode

# Installing tmux plugin manager (<C-b><S-i> to update)
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Installing rust better commands
sudo pacman -S --needed exa fd bat
yay -S --needed bottom

# Configuring git
git config --global user.email "lucaspaiolla@gmail.com"
git config --global user.name "Lucas Paiolla"
sudo pacman -S openssh
ssh-keygen -t ed25519 -C "lucaspaiolla@gmail.com"

# Installing microsoft edge (you might remove -dev in the future)
yay -S --needed microsoft-edge-dev

# Installing wakatime for zsh
pip install wakatime
git clone https://github.com/sobolevn/wakatime-zsh-plugin.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/wakatime

# Installing python support nvim
pip install pynvim

# Installing jupyter and it's plugins
pip install jupyter
pip install jupyterlab
pip install jupyter-kite
jupyter labextension install "@kiteco/jupyterlab-kite"
pip install jupyterlab_vim
jupyter labextension install jupyterlab_onedarkpro

mkdir -p $(jupyter --data-dir)/nbextensions
pushd $(jupyter --data-dir)/nbextensions
git clone https://github.com/lambdalisue/jupyter-vim-binding vim_binding
jupyter nbextension enable vim_binding/vim_binding
popd

pip install jupyter-tabnine --user
jupyter nbextension install --py jupyter_tabnine --user
jupyter nbextension enable --py jupyter_tabnine --user
jupyter serverextension enable --py jupyter_tabnine --user

# Installing neofetch
# (this program shows your configurations when you enter the terminal)
sudo pacman -S --needed neofetch

# Installing flameshot
sudo pacman -S --needed flameshot

# Installing spotify
# (the first step might not be needed, but when I tried to install, I
# could'nt get the required key)
gpg --keyserver keyserver.ubuntu.com --recv-key 8FD3D9A8D3800305A9FFF259D1742AD60D811D58
yay -S --needed spotify

# Installing telegram
sudo pacman -S --needed telegram-desktop
