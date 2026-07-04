export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

ZSH=$HOME/.oh-my-zsh

ZSH_THEME=""

export ZSH_CUSTOM=$HOME/.zsh-custom
plugins=(extract z git kubectl helm mvn npm docker bazel zsh-autosuggestions zsh-syntax-highlighting)

if [[ $('uname') == 'Linux' ]]; then
fi

if [[ $('uname') == 'Darwin' ]]; then
    plugins+=(brew)
    export HOMEBREW_NO_AUTO_UPDATE=1
fi

# Warp has built-in autosuggestions & syntax-highlighting; skip these plugins
if [[ "$TERM_PROGRAM" == "WarpTerminal" ]]; then
    plugins=(${plugins:#zsh-autosuggestions})
    plugins=(${plugins:#zsh-syntax-highlighting})
fi

# Create user level tmp
(! test -e /tmp/$USER_tmp_inited) && rm -rf ~/.tmp && mkdir -p ~/.tmp && chmod 700 ~/.tmp && touch /tmp/$USER_tmp_inited

# Env Profile
if [ -f ~/.env_profile ]; then
    source ~/.env_profile
fi

# Alias
source ~/.alias_profile

# Completions (FPATH must be set before oh-my-zsh, which calls compinit internally)
if type brew &>/dev/null; then
    export FPATH=$(brew --prefix)/share/zsh-completions:$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

export DISABLE_AUTO_UPDATE="true"
source $ZSH/oh-my-zsh.sh

# Starship (skip in Warp, which has its own prompt)
if [[ "$TERM_PROGRAM" != "WarpTerminal" ]] && type starship &>/dev/null; then
  export STARSHIP_CONFIG="$HOME/.starship.toml"
  eval "$(starship init zsh)"
fi
