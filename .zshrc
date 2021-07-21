# Lines configured by zsh-newuser-install
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/mectx02/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Allow for pyenv to work
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

PROMPT="%B%F{14}%n@%m [%2~] %F{15}%b$ "
alias ls="ls --color='auto'"
