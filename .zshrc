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
alias gp="git push -u origin HEAD"
alias gai="git add -i"

# Other Aliases
alias vim="nvim"
alias dps="docker ps --format 'table {{.Image}}\t{{.RunningFor}}\t{{.Status}}\t{{.Names}}'"
alias fz='nvim -o `fzf`'
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"

# Sick Function To Auto LS When CD
function chpwd() {
    emulate -L zsh
    ls -a
}

# Ranger Danger
ranger() {
  if [ -z "$RANGER_LEVEL" ]; then
      /usr/local/bin/ranger "$@"
  else
      exit
  fi
}

# So sick method to merge develop into feature branch
mdev() {
    gco develop
    gl
    gco feature/$1
    g merge develop
    gp
}

# Sick Searches
isearch()
{
  if [ -z $1 ]; then
      echo "No Search String Given"
  elif [ -z $2 ]; then
      grep -riIn --exclude-dir=env -C 1 --color $1 .
  elif [ -z $3 ]; then
      grep -riIn --exclude-dir=env -C $2 --color $1 .
  else
      grep -riIn --exclude-dir=env -C $2 --color $1 $3
  fi
}

search()
{
  if [ -z $1 ]; then
      echo "No Search String Given"
  elif [ -z $2 ]; then
      grep -rIn --exclude-dir=env -C 1 --color $1 .
  else
      grep -rIn --exclude-dir=env -C $2 --color $1 .
  fi
}


# Source All My Shit
source ~/.p10k.zsh
source $ZSH/oh-my-zsh.sh
source ~/.bin/tmuxinator.zsh

# Set Default Editor
export EDITOR='nvim'
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
