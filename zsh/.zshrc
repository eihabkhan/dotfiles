# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"

# P10K
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Oh My Zsh installation
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
	git
  zsh-syntax-highlighting
  z
)

source $ZSH/oh-my-zsh.sh

# Aliases
alias c="code"

alias p="pnpm"

alias o="ollama"
alias ods="ollama run deepseek-r1:7b"

# -------------------------------- #
# Git
# -------------------------------- #

alias gs="git status"
alias gp='git push'
alias gpf='git push --force'
alias gcl='git clone'
alias gst='git stash'
alias grm='git rm'
alias gmv='git mv'

alias main='git checkout main'
alias master='git checkout master'

alias gco='git checkout'
alias gcob='git checkout -b'

alias gl='git log'
alias glo='git log --oneline --graph'

alias ga="git add"
alias gA='git add -A'

alias gc="git commit"
alias gcm='git commit -m'
alias gca='git commit -a'

alias glp='git log --pretty=format:"%C(yellow)%h%Creset - %C(green)%an%Creset, %ar : %s"'

alias add="git add"
alias commit="git commit -m"
alias push="git push"
alias pull="git pull"
alias fetch="git fetch"
alias merge="git merge"
alias rebase="git rebase"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# fnm
if command -v fnm >/dev/null 2>&1; then
  eval "$(fnm env --use-on-cd --shell zsh)"
fi

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"

# Ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"

# Yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
