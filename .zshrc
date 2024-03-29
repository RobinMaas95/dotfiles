source ~/.zplug/init.zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/robin/.oh-my-zsh"

# Deactivate Warning because of brew installation
ZSH_DISABLE_COMPFIX="true"

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

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

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
plugins=(docker git z github history macos pip python vscode aws terraform zsh-syntax-highlighting zsh-autosuggestions kubectl zsh-secrets git-auto-fetch)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
 else
   export EDITOR='nvim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias la='ls -lah --color=auto'
alias lh='ls -lh --color=auto'
alias ls='ls --color=auto'
alias l='ls --color=auto'
alias grep='grep --color=auto'
alias k="kubectl"
alias lg='lazygit'
alias exa="exa --long --git --header"
#
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# source /Users/robin/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Gray color for autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=247'

# Load plugins
source ~/.zplug/init.zsh
zplug "woefe/wbase.zsh"
zplug "woefe/git-prompt.zsh", use:"{git-prompt.zsh,examples/wprompt.zsh}"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:3
zplug "jeffreytse/zsh-vi-mode"
zplug load

# Config command for managing dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME'
export PATH="/Users/robin/Library/Python/3.8/bin/:$PATH"

# Autocomplete Azure CLI
# autoload -U +X bashcompinit && bashcompinit
# source /opt/homebrew/etc/bash_completion.d/az

# Created by `pipx` on 2022-05-24 12:53:34
# export PATH="$PATH:/Users/robin/.local/bin"
# export PYENV_ROOT="$HOME/.pyenv"
# command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"

# navi
eval "$(navi widget zsh)"
export PATH="/opt/homebrew/opt/node@16/bin:$PATH"

# zoxide
eval "$(zoxide init zsh)"

# Export go bin Path
export PATH=$PATH:/Users/robin/go/bin


## Set up Pipenv
# Set your preferred Python version.
export PYENV_VERSION=3.11.0

export PIPX_BIN_DIR=~/.local/bin
export PYENV_ROOT=~/.pyenv

# -U eliminates duplicates.
export -U PATH path         
path=( 
    $PIPX_BIN_DIR
    $PYENV_ROOT/{bin,shims} 
    $path
)

# Updates the global python, if necessary, and installs/upgrades pipenv.
pybake() {
  # Install pyenv, if necessary.
  command -v pyenv > /dev/null || 
      brew install pyenv

  # Install your preferred Python.
  # Does nothing if $PYENV_VERSION hasn't changed.
  pyenv install --skip-existing $PYENV_VERSION

  pyenv global $PYENV_VERSION  # Make it your default.
  pip install -U pip           # Update pip.

  # Install pipx (into ~/.local/bin) or update it.
  # pipx is like brew, but for Python.
  pip install -U --user pipx   

  # Install or update pipenv.
  pipx ${${$( command -v pipenv ):+upgrade}:-install} pipenv
}

eval "$( pyenv init - )"
eval "$( pip completion --zsh )"
eval "$( register-python-argcomplete pipx )"
