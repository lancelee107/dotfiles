# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/opt/homebrew/bin:$HOME/.local/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Current Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugins
plugins=(
    git
    you-should-use
    zsh-autosuggestions
)

# Color of autosuggest text
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=213'

# Git Aliases
alias gai="git add -i"
alias gac="git add . && git commit -m" # + commit message

# Other Aliases
alias vim="nvim"
alias fz='nvim -o `fzf`'
alias lg='lazygit'
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"

# Sick Function To Auto LS When CD
function chpwd() {
    emulate -L zsh
    ls -al
}

# ssh into prod
tgip() {
    if [ -z $2 ]; then
        aws-vault exec tg-$1 -- crowbar containerip #  | tail -n 1
    else
        aws-vault exec tg-$1 -- crowbar containerip -c $2 -s $3 | tail -n 1
    fi
}

# Source All My Shit
source ~/.p10k.zsh
source $ZSH/oh-my-zsh.sh

# Set Default Editor
export EDITOR='nvim'

# autojump
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd -t file -H'
export FZF_DEFAULT_OPS="--extended"


[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# direnv: auto-activate venv / env per directory (.envrc)
eval "$(direnv hook zsh)"
