# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zstyle ':prezto:module:tmux:auto-start' local 'yes'
zstyle ':prezto:module:tmux:auto-start' remote 'yes'
zinit snippet PZT::modules/tmux/init.zsh

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

## Setup ssh
zstyle :omz:plugins:ssh-agent agent-forwarding yes
zstyle :omz:plugins:ssh-agent quiet yes

## Use vim as editor
export EDITOR="vim"

zinit ice depth=1; zinit light romkatv/powerlevel10k

zinit wait lucid for \
  OMZ::lib/git.zsh \
  OMZ::plugins/fasd/fasd.plugin.zsh \
  OMZ::plugins/fzf/fzf.plugin.zsh \
  OMZ::plugins/git/git.plugin.zsh \
  OMZ::plugins/gpg-agent/gpg-agent.plugin.zsh \
  OMZ::plugins/ssh-agent/ssh-agent.plugin.zsh \
  OMZ::plugins/sudo/sudo.plugin.zsh \
  PZT::modules/directory/init.zsh \
  PZT::modules/helper/init.zsh \
  PZT::modules/history/init.zsh \
  MohamedElashri/exa-zsh \
  chrissicool/zsh-256color \
  wookayin/fzf-fasd \
  zdharma-continuum/zui \
  atinit"zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
  atload"_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions \
  atinit"zmodload zsh/curses" \
    zdharma-continuum/zinit-console

zinit for \
    atload"zicompinit; zicdreplay" \
    blockf \
    lucid \
    wait \
  zsh-users/zsh-completions

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
