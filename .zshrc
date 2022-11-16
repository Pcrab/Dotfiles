# init ZI

if [[ ! -f $HOME/.zi/bin/zi.zsh ]] {
  print -P "%F{33}▓▒░ %F{160}Installing (%F{33}z-shell/zi%F{160})…%f"
  command mkdir -p "$HOME/.zi" && command chmod g-rwX "$HOME/.zi"
  command git clone -q --depth=1 --branch "main" https://github.com/z-shell/zi "$HOME/.zi/bin" && \
    print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
    print -P "%F{160}▓▒░ The clone has failed.%f%b"
}

source "$HOME/.zi/bin/zi.zsh"
autoload -Uz _zi
(( ${+_comps} )) && _comps[zi]=_zi

# Starship Prompt
(( $+commands[starship] )) || (curl -sS https://starship.rs/install.sh | sh && mkdir $HOME/.config && starship preset nerd-font-symbols > $HOME/.config/starship.toml)
eval "$(starship init zsh)"

# Optimize
ZI[OPTIMIZE_OUT_DISK_ACCESSES]=1

# History
setopt SHARE_HISTORY HIST_IGNORE_ALL_DUPS HIST_EXPIRE_DUPS_FIRST HIST_IGNORE_DUPS HIST_IGNORE_SPACE HIST_SAVE_NO_DUPS INC_APPEND_HISTORY
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=1000

# Other Options
setopt AUTO_PUSHD AUTO_CD AUTO_LIST AUTO_LIST PUSHD_IGNORE_DUPS INTERACTIVE_COMMENTS 

# Completion
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'
zstyle ':completion:*' use-cache true
zstyle ':completion:*' rehash true
zstyle ":history-search-multi-word" page-size "11"
zstyle ':completion:*' menu select

# ZI
zi wait lucid light-mode depth"1" for \
    atinit"ZI[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
        z-shell/F-Sy-H \
    atload"_zsh_autosuggest_start;" \
        zsh-users/zsh-autosuggestions \
    blockf has'git' atload'export GPG_TTY=$(tty)' \
        OMZL::git.zsh \
        OMZP::git \
    z-shell/zzcomplete \

zi wait'1' lucid light-mode depth"1" for \
    as'completion' \
        zsh-users/zsh-completions \
    as'completion' blockf has'cargo' \
        https://raw.githubusercontent.com/rust-lang/cargo/master/src/etc/_cargo \
    as'completion' blockf has'rustc' \
        https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/rust/_rustc \
    as'completion' blockf has'yadm' \
        https://raw.githubusercontent.com/TheLocehiliosan/yadm/master/completion/zsh/_yadm \
    blockf has'brew' \
        OMZP::brew \
    OMZP::extract

# History Search
zi light zsh-users/zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# Proxy
alias proxy="source $HOME/.bin/proxy"
. $HOME/.bin/proxy set

# Custom
for file in $HOME/.zsh/*.zsh; do
  source "$file"
done

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
