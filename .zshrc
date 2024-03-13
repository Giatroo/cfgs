# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="/home/giatro/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
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

# Code (seems to need this =/)
export WSL_DISTRO_NAME="Ubuntu"

# Custom aliases:

alias e:="cd /mnt/e/"
alias d:="cd /mnt/d/"
alias c:="cd /mnt/c/"

alias ime="e: && cd _Estudos\ IME-USP/"
alias bcc=ime
alias 1sem="ime && cd 1_Semestre/"
alias 2sem="ime && cd 2_Semestre/"
alias 3sem="ime && cd 3_Semestre/"
alias 4sem="ime && cd 4_Semestre/"
alias 5sem="ime && cd 5_Semestre/"
alias 6sem="ime && cd 6_Semestre/"
alias 7sem="ime && cd 7_Semestre/"
alias 8sem="ime && cd 8_Semestre/"
alias 9sem="ime && cd 9_Semestre/"
alias tcc="7sem && cd Trabalho_de_Conclusão_de_Curso_MAC0499/"

alias coding="e: && cd Coding"
alias ml="e: && cd Coding/machine_learning"
alias pysource="source venv/bin/activate"
alias turnrpg="coding && cd python_workspace/turnrpg/ && pysource && export PYTHONPATH="$PWD""

alias estagio="e: && cd _Estgio_BigData"
alias bigdata=estagio

alias rpg="e: && cd Games/RPG/D\&D"
alias sds="e: && cd Games/RPG/D\&D/Senhor\ das\ Sombras"
alias foundry="rpg && .. && cd FoundryVTTData/Data/systems/sds"

alias bee="coding && cd pythonWorkspace/BeeData/"
alias beedata=bee

alias ai="e: && cd Estudos/Artificial\ Intelligence"
alias ds="e: && cd Estudos/DataScience"
alias jn="jupyter notebook &"
alias jl="jupyter-lab &"

alias explorer="explorer.exe . &"
alias nautilus=explorer

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
alias vimwiki="vim +VimwikiIndex 1"

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
PATH="/usr/local/cuda-11.8/bin:$PATH"
export PATH

# Adding CUDA to LD_LIBRARY_PATH
LD_LIBRARY_PATH="/usr/local/cuda/lib64:$LD_LIBRARY_PATH"
LD_LIBRARY_PATH="/usr/local/cuda/include:$LD_LIBRARY_PATH"
LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/cuda/extras/CUPTI/lib64"
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

neofetch
