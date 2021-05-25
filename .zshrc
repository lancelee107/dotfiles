# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/lance/.oh-my-zsh"

# Current Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Plugins
plugins=(
    git
    Z
    you-should-use
	zsh-autosuggestions
)

# Color of autosuggest text
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=213'

# Git Aliases
alias gai="git add -i"
alias gac="git add . && git commit -m" # + commit message

# Other Aliases
alias vi="nvim"
alias ve="vim +Explore"
alias dps="docker ps --format 'table {{.Image}}\t{{.RunningFor}}\t{{.Status}}\t{{.Names}}'"
alias fz='vim -o `fzf`'
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
source ~/.bin/tmuxinator.zsh

# Set Default Editor
export EDITOR='vim'
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd -t file -H'
export FZF_DEFAULT_OPS="--extended"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/lance/Code/impressions/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/lance/Code/impressions/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/lance/Code/impressions/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/lance/Code/impressions/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Users/lance/Code/impressions/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/lance/Code/impressions/node_modules/tabtab/.completions/slss.zsh

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true
