# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export TERM="xterm-256color"

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# tmux
ZSH_TMUX_AUTOSTART=true

# ensure zsh is use in tmux
autoload colors zsh/terminfo
colors

# Coloured man pages using less as pager
man() {
    env \
	      LESS_TERMCAP_mb=$(printf "\e[1;31m") \
	      LESS_TERMCAP_md=$(printf "\e[1;31m") \
	      LESS_TERMCAP_me=$(printf "\e[0m") \
	      LESS_TERMCAP_se=$(printf "\e[0m") \
	      LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
	      LESS_TERMCAP_ue=$(printf "\e[0m") \
	      LESS_TERMCAP_us=$(printf "\e[1;36m") \
	      man "$@"
}

# Set name of the theme to load.
ZSH_THEME="powerlevel9k/powerlevel9k"

source ~/Github/bzon/dotfiles/powerleverl9k.zsh

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-autosuggestions
  kubectl
  kube-ps1
)

if [[ -f $HOME/.profile ]]; then
  source ~/.profile
fi

source $ZSH/oh-my-zsh.sh

#neofetch

# iterm
PATH=$HOME/.iterm2:$PATH


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# added by travis gem
[ -f /Users/jb/.travis/travis.sh ] && source /Users/jb/.travis/travis.sh

# Disable suggestions
_zsh_autosuggest_disable() {
	typeset -g _ZSH_AUTOSUGGEST_DISABLED
	_zsh_autosuggest_clear
	zle -N self-insert url-quote-magic
}

# Enable suggestions
_zsh_autosuggest_enable() {
	unset _ZSH_AUTOSUGGEST_DISABLED
	zle -N self-insert _zsh_autosuggest_bound_1_self-insert

	if [ $#BUFFER -gt 0 ]; then
		_zsh_autosuggest_fetch
	fi
}
