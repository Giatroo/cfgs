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
giatro_path_dict[neofetch]="$HOME/.config/neofetch/config.conf"
giatro_path_dict[p10k]="$HOME/.p10k.zsh"

declare -A local giatro_file_name_dict
giatro_file_name_dict[zsh]=".zshrc"
giatro_file_name_dict[bash]=".bashrc"
giatro_file_name_dict[tmux]=".tmux.conf"
giatro_file_name_dict[vi]=".vimrc"
giatro_file_name_dict[vim]="nvim/"
giatro_file_name_dict[nvim]="nvim/"
giatro_file_name_dict[neofetch]="neofetch.conf"
giatro_file_name_dict[p10k]=".p10k.zsh"

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

alias userconfig="pushd $USERCONFIG/"

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
export TERM=tmux-256color
export EDITOR=nvim

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Adding some folders to PATH
PATH="/home/giatro/.local/bin:/usr/bin:/usr/local/go/bin:$PATH"
PATH="$HOME/go/bin:$PATH"
PATH="$HOME/.cargo/bin:$PATH"
export PATH

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

# Syntax-Highlighting (must be at the end of the configuration file)
source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

neofetch
