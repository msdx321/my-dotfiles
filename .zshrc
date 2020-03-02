#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
LS_COLORS="ow=01;36;40" && export LS_COLORS
export GPG_TTY=$(tty)
export TERM=xterm-256color

# Powerlevel9k's config
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir_writable dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs virtualenv)

# Fzf bringup
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
