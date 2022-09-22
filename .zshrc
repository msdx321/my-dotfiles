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

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk
zstyle ':prezto:module:tmux:auto-start' local 'no'
zstyle ':prezto:module:tmux:auto-start' remote 'yes'
zinit snippet PZT::modules/tmux/init.zsh

## Use vim as editor
export EDITOR="vim"

## Set p10k prompt
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir_writable dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs virtualenv)

zinit ice depth=1; zinit light romkatv/powerlevel10k

zinit wait lucid for \
  OMZ::lib/git.zsh \
  OMZ::plugins/fasd/fasd.plugin.zsh \
  OMZ::plugins/fzf/fzf.plugin.zsh \
  OMZ::plugins/git/git.plugin.zsh \
  OMZ::plugins/sudo/sudo.plugin.zsh \
  OMZ::plugins/gpg-agent/gpg-agent.plugin.zsh \
  PZT::modules/helper/init.zsh \
  PZT::modules/directory/init.zsh \
  PZT::modules/history/init.zsh \
  DarrinTisdale/zsh-aliases-exa \
  chrissicool/zsh-256color \
  wookayin/fzf-fasd \
  zdharma-continuum/zui \
  atinit"zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
  atload"_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions \
  blockf atpull'zinit creinstall -q .' \
    zsh-users/zsh-completions \
  atinit"zmodload zsh/curses" \
    zdharma-continuum/zinit-console
