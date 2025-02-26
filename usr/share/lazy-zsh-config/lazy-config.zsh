# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Path to your oh-my-zsh installation.
export ZSH="/usr/share/oh-my-zsh"

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
[[ -z "${plugins[*]}" ]] && plugins=(git fzf extract)

source $ZSH/oh-my-zsh.sh

# User configuration

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Ignore commands that start with spaces and duplicates.

export HISTCONTROL=ignoreboth

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Don't add certain commands to the history file.

export HISTIGNORE="&:[bf]g:c:clear:history:exit:q:pwd:* --help"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Use custom `less` colors for `man` pages.

export LESS_TERMCAP_md="$(tput bold 2> /dev/null; tput setaf 2 2> /dev/null)"
export LESS_TERMCAP_me="$(tput sgr0 2> /dev/null)"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Make new shells get the history lines from all previous
# shells instead of the default "last window closed" history.

export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

## System commands
alias _='sudo'
alias tarnow='tar -acf'
alias untar='tar -zxvf'
alias wget='wget -c'
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias upg='topgrade --disable git_repos'
## Improved commands
alias du='dust'
#alias grep='rg'
alias cat='bat'
alias ls='exa --icons'
## XBPS
alias xu='sudo xbps-install -u xbps && sudo xbps-install -Suv'
alias xin='sudo xbps-install'
alias xr='sudo xbps-remove -Rcon'
alias xl='xbps-query -l'
alias xf='xl | grep'
alias xs='xbps-query -Rs'
alias xd='xbps-query -x'
alias clrk='sudo vkpurge rm all && sudo rm -rf /var/cache/xbps/*'
## Flatpak
alias fu='flatpak update'
alias fin='flatpak install'
alias ff='flatpak repair'
alias fs='flatpak search'
alias fl='flatpak list'
alias fud='flatpak uninstall --delete-data'
alias fuu='flatpak uninstall –-unused'
## Nix
alias nu='nix-env -u'
alias nf='nix-env --query'
alias na='nix-env --query "*"'
alias ni='nix-env -i'
alias nr='nix-env -e'
alias ns='nix search'
alias no='nix-env --rollback'
alias ncl='nix-channel --list'
alias nca='nix-channel --add'
alias ncu='nix-channel --update'
## System Controls
alias halt='sudo halt'
alias poweroff='sudo poweroff'
alias reboot='sudo reboot'
alias shutdown='sudo shutdown'

alias journalctl='sudo svlogtail'

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# Fish-like syntax highlighting and autosuggestions
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Use history substring search
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export FZF_BASE=/usr/share/fzf
