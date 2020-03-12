### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk
## Fix color under WSL
export LS_COLORS="ow=01;36;40"

## Use vim as editor
export EDITOR="vim"

## Auto start tmux
zstyle ':prezto:module:tmux:auto-start' local 'yes'
zstyle ':prezto:module:tmux:auto-start' remote 'no'
zstyle ':prezto:module:tmux:session' name 'WSL'

## Load SSH credential
zstyle ':prezto:module:ssh:load' identities 'id_rsa'

## Set up editor plugin
zstyle ':prezto:module:editor' key-bindings 'emacs'
zstyle ':prezto:module:editor' dot-expansion 'yes'
zstyle ':prezto:module:editor' ps-context 'yes'

## Set p10k prompt
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir_writable dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs virtualenv)

## Load plugins
zinit ice depth=1
zinit light romkatv/powerlevel10k

zinit wait lucid light-mode for \
  OMZ::lib/git.zsh \
  OMZ::plugins/fasd/fasd.plugin.zsh \
  OMZ::plugins/fzf/fzf.plugin.zsh \
  OMZ::plugins/git/git.plugin.zsh \
  OMZ::plugins/sudo/sudo.plugin.zsh \
  PZT::modules/helper/init.zsh \
  PZT::modules/directory/init.zsh \
  PZT::modules/editor/init.zsh \
  PZT::modules/gpg/init.zsh \
  PZT::modules/history/init.zsh \
  PZT::modules/ssh/init.zsh \
  DarrinTisdale/zsh-aliases-exa \
  chrissicool/zsh-256color \
  wookayin/fzf-fasd \
  zdharma/zui \
  atinit"zicompinit; zicdreplay" \
    zdharma/fast-syntax-highlighting \
  atload"_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions \
  blockf atpull'zinit creinstall -q .' \
    zsh-users/zsh-completions \
  atinit"zmodload zsh/curses" \
    zinit-zsh/zinit-console

zinit snippet PZT::modules/tmux/init.zsh
