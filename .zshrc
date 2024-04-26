# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=${HOME}/.oh-my-zsh

# Uncomment to profile startup time
#zmodload zsh/zprof

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="agnoster"
ZSH_THEME="powerlevel10k/powerlevel10k"
#POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=7

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd-mm-yy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  git-flow
  encode64
  extract
  fzf
  iterm2
  jira
  nmap
  macos
  ripgrep
  ssh-agent
  wd
  yarn
  zsh-autosuggestions
  zsh-syntax-highlighting
)

export JIRA_URL=https://notalib.atlassian.net
export JIRA_NAME=Daniel\ Freiling
export JIRA_PREFIX=NOTA-
export JIRA_DEFAULT_ACTION=dashboard

export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=40
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#737373"
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='code'
fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# SSH
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{exports,path,aliases,functions,extra,completion}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# iTerm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Disable shared tab history
unsetopt inc_append_history
unsetopt share_history

# Load NVM
# Make sure these statements execute before sourcing bash completion.
export NVM_DIR="${HOME}/.nvm"
source $(brew --prefix nvm)/nvm.sh

if [ -f '/usr/local/share/zsh/site-functions' ]; then . '/usr/local/share/zsh/site-functions'; fi

# Install our tab completion.
autoload -Uz compinit && compinit
autoload -Uz bashcompinit && bashcompinit
# Add tab completion for many Bash commands
# if which brew &> /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
#   source "$(brew --prefix)/share/bash-completion/bash_completion";
# fi

# Load auto-completion scripts for other CLI tools
source ~/.completion
# NOTE: apparently not needed for aliases to autocomplete
# compdef __start_kubectl k
# compdef __start_docc "docker compose"

# ZFZ fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export dotnet=/usr/local/share/dotnet/dotnet

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
# export SDKMAN_DIR="/Users/b044554/.sdkman"
# [[ -s "/Users/b044554/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/b044554/.sdkman/bin/sdkman-init.sh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Uncomment to profile startup time
#zprof

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/B044554/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
