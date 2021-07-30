# Lines configured by zsh-newuser-install
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/mectx02/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# 
# Set default applications 
#
export EDITOR=vim
export TERM="xterm-256color"

# Allow for pyenv to work
#export PYENV_ROOT="$HOME/.pyenv"
#export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init --path)"
PS1="%B%F{13}%n@%m [%2~] %F{15}%b$ "
alias ls="ls -Ag --group-directories-first --color='auto'"
