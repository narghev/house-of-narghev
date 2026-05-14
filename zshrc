export ZSH="/Users/narghev/.oh-my-zsh"

plugins=(
	git
	colored-man-pages
	zsh-autosuggestions
	auto-notify
	zsh-syntax-highlighting
	direnv
)

source $ZSH/oh-my-zsh.sh

HISTFILE=~/.zsh_history
SAVEHIST=1000
HISTSIZE=1000
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

export EDITOR='nvim'

if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh/base.toml)"
fi

#Aliases
alias cat="bat"
alias mullvad:up="tailscale down && mullvad connect"
alias tailscale:up="mullvad disconnect && tailscale up"
alias vpn:down="mullvad disconnect && tailscale down"
alias kartes="$HOME/.tmux/kartes.sh"
alias toptal="$HOME/.tmux/toptal.sh"
alias nv="nvim ."

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Source private configuration (API keys, secrets, etc.)
if [ -f ~/.zshrc.private ]; then
    source ~/.zshrc.private
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/narghev/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/narghev/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/narghev/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/narghev/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
export PATH="$HOME/.local/bin:$PATH"
export CLAUDE_CONFIG_DIR=~/.claude-personal
