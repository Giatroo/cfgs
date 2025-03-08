# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="/home/giatro/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  asdf
  git
  colored-man-pages
  colorize
  tmux
  zsh-vi-mode
  zsh-autosuggestions
  #wakatime
)

# TMUX Plugin:
ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOSTART_ONCE=true
ZSH_TMUX_AUTOCONNECT=true
ZSH_TMUX_AUTOQUIT=$ZSH_TMUX_AUTOSTART
ZSH_TMUX_CONFIG=$HOME/.tmux.conf

source $ZSH/oh-my-zsh.sh

# User configuration
USERCONFIG=$HOME/.config/user/

# X server windows
export LIBGL_ALWAYS_INDIRECT=1
export WSL_HOST=$(tail -1 /etc/resolv.conf | cut -d' ' -f2)
export DISPLAY=$WSL_HOST:0

# Custom aliases:
source ~/.zshrc_aliases

# Configurations files aliases
declare -A local giatro_path_dict
giatro_path_dict[zsh]="$HOME/.zshrc"
giatro_path_dict[bash]="$HOME/.bashrc"
giatro_path_dict[tmux]="$HOME/.tmux.conf"
giatro_path_dict[vi]="$HOME/.vimrc"
giatro_path_dict[vim]="$HOME/.config/nvim/"
giatro_path_dict[nvim]="$HOME/.config/nvim/"
giatro_path_dict[latexmacros]="$USERCONFIG/giatro_macros.tex"
giatro_path_dict[latexpackages]="$USERCONFIG/giatro_packages.tex"
giatro_path_dict[vimwiki]="$HOME/vimwiki/"
giatro_path_dict[zathura]="$HOME/.config/zathura/.zathurarc"
giatro_path_dict[alacritty]="$HOME/.config/alacritty/alacritty.yml"
giatro_path_dict[picom]="$HOME/.config/picom/picom.conf"
giatro_path_dict[i3]="$HOME/.config/i3/config"
giatro_path_dict[neofetch]="$HOME/.config/neofetch/config.conf"
giatro_path_dict[xprofile]="$HOME/.xprofile"
giatro_path_dict[p10k]="$HOME/.p10k.zsh"
giatro_path_dict[clang-format]="$HOME/.clang-format"
giatro_path_dict[gitconfig]="$HOME/.gitconfig"
giatro_path_dict[git]="$HOME/.gitconfig"
giatro_path_dict[lightdm]="/etc/lightdm/"
giatro_path_dict[rofi]="$HOME/.config/rofi/"
giatro_path_dict[polybar]="$HOME/.config/polybar/"

declare -A local giatro_file_name_dict
giatro_file_name_dict[zsh]=".zshrc"
giatro_file_name_dict[bash]=".bashrc"
giatro_file_name_dict[tmux]=".tmux.conf"
giatro_file_name_dict[vi]=".vimrc"
giatro_file_name_dict[vim]="nvim/"
giatro_file_name_dict[nvim]="nvim/"
giatro_file_name_dict[latexmacros]="giatro_macros.tex"
giatro_file_name_dict[latexpackages]="giatro_packages.tex"
giatro_file_name_dict[vimwiki]="vimwiki/"
giatro_file_name_dict[zathura]=".zathurarc"
giatro_file_name_dict[alacritty]="alacritty.yml"
giatro_file_name_dict[picom]="picom.conf"
giatro_file_name_dict[i3]="i3config"
giatro_file_name_dict[neofetch]="neofetch.conf"
giatro_file_name_dict[p10k]=".p10k.zsh"
giatro_file_name_dict[clang-format]=".clang-format"
giatro_file_name_dict[gitconfig]=".gitconfig"
giatro_file_name_dict[git]=".gitconfig"
giatro_file_name_dict[lightdm]="lightdm/"
giatro_file_name_dict[rofi]="rofi/"
giatro_file_name_dict[polybar]="polybar/"

function config  {
  local file_path=$giatro_path_dict[$1]
  local file_name=$giatro_file_name_dict[$1]

  if [ -d $file_path ]
  then
    pushd $file_path
  fi
  if [ -f $file_path ]
  then
    nvim $file_path
    cp $file_path $USERCONFIG/$file_name
  fi
}

function configg  {
  local file_path=$giatro_path_dict[$1]
  local file_name=$giatro_file_name_dict[$1]

  if [ -d $file_path ]
  then
    cp -r $file_path/* $USERCONFIG/$file_name
    pushd $USERCONFIG/$file_name
    git add *
    git commit
    git push
    popd
  fi
  if [ -f $file_path ]
  then
    nvim $file_path
    cp $file_path $USERCONFIG/$file_name
    pushd $USERCONFIG/
    git add $file_name
    git commit
    git push
    popd
  fi
}

alias userconfig="pushd $USERCONFIG/"

alias createlatex="cp $USERCONFIG/LatexTemplate.tex ."
alias createreadme="cp $USERCONFIG/README_template.md ./README.md && vim ./README.md"

# Program aliases
alias vim="nvim"
alias vi="nvim"

alias open="zathura"

alias g="git"
alias gs="git status"
alias gd="git diff"

alias c="clear"
alias ls="exa"
alias cat="bat"
alias top="btm -c"
alias find="fd"

alias resource="source ~/.zshrc"

# Vim mode
bindkey -v
#export KEYTIMEOUT=1
export TERM=tmux-256color
export EDITOR=nvim

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Adding some folders to PATH
PATH="/home/giatro/.local/bin:$PATH"
PATH="/usr/bin:$PATH"
PATH="$HOME/.config/rofi/bin:$PATH"
PATH="/usr/local/cuda-12.3/bin:$PATH"
PATH="/usr/local/go/bin:$PATH"
PATH="$HOME/go/bin:$PATH"
PATH="$HOME/.cargo/bin:$PATH"
export PATH

# Adding CUDA to LD_LIBRARY_PATH
LD_LIBRARY_PATH="/usr/local/cuda/lib64:$LD_LIBRARY_PATH"
LD_LIBRARY_PATH="/usr/local/cuda/include:$LD_LIBRARY_PATH"
LD_LIBRARY_PATH="/usr/local/cuda/extras/CUPTI/lib64:$LD_LIBRARY_PATH"
export LD_LIBRARY_PATH

# Autosuggestions configuration
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#427b87"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# asdf version manager
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# Syntax-Highlighting (must be at the end of the configuration file)
source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# neofetch
