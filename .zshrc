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
  git
  colored-man-pages
  colorize
  tmux
  vi-mode
  zsh-autosuggestions
)

# TMUX Plugin:
ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_CONFIG=$HOME/.tmux.conf

source $ZSH/oh-my-zsh.sh

# User configuration

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias vim="nvim"
alias c="clear"

alias lucas="cd /media/sf_Lucas/"
alias Lucas="cd /media/sf_Lucas/"
alias ime="cd ~/IME/"
alias bcc="cd ~/IME/"
alias 4sem="ime && cd 4_Semestre/"
alias maratona="cd ~/Desktop/Maratona/"
alias ai="lucas && cd Artificial\ Intelligence"
alias coding="cd /media/sf_Coding/"
alias web="cd /media/sf_Coding/webWorkspace/"
alias nlw="cd ~/Desktop/NLW3/"

alias ohmyzsh="vim  ~/.oh-my-zsh"
alias zshconfig="vim ~/.zshrc && cp ~/.zshrc ~/.config/user/.zshrc"
alias zshconfigg="pushd ~ && vim .zshrc && cp .zshrc ~/.config/user/.zshrc && pushd ~/.config/user/ && git add .zshrc && git commit -m 'Editing .zshrc' && git push && popd && popd"
alias tmuxconfig="vim ~/.tmux.conf && cp ~/.tmux.conf ~/.config/user/.tmux.conf"
alias tmuxconfigg="pushd ~ && vim .tmux.conf && cp .tmux.conf ~/.config/user/.tmux.conf && pushd ~/.config/user/ && git add .tmux.conf && git commit -m 'Editing .tmux.conf' && git push && popd && popd"
alias vimconfig="pushd ~/.config/nvim/"
alias vimconfigg="pushd ~/.config/nvim/ && cp -r ./* ~/.config/user/nvim/ && pushd ~/.config/user/nvim/ && git add * && git commit -m 'Editing neovim configs' && git push && popd && popd"
alias latexmacrosconfig="vim ~/.config/user/giatro_macros.tex"
alias latexmacrosconfigg="pushd ~/.config/user/ && vim giatro_macros.tex && git add giatro_macros.tex && git commit -m 'Editing LaTeX macros' && git push && popd"
alias latexpackagesconfig="vim ~/.config/user/giatro_packages.tex"
alias latexpackagesconfigg="pushd ~/.config/user/ && vim giatro_packages.tex && git add giatro_packages.tex && git commit -m 'Editing LaTeX packages' && git push && popd"

alias userconfig="pushd ~/.config/user/"

alias createlatex="cp ~/.config/user/LatexTemplate.tex ."
alias vimwiki="vim +VimwikiIndex 1"

alias python="python3"
alias pip="pip3"

alias open="xdg-open"

# Vim mode
bindkey -v
export KEYTIMEOUT=1
export TERM=xterm-256color

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Syntax-Highlighting (must be at the end of the configuration file)
source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Autosuggestions configuration
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#427b87,bold"

# Adding bin to PATH
export PATH="$PATH:/home/giatro/.local/bin:/home/giatro/bin"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
