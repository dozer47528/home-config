export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

ZSH=$HOME/.oh-my-zsh

ZSH_THEME=""
plugins=(extract z git kubectl helm mvn npm docker bazel)

if [ ! -n "$WARP_IS_LOCAL_SHELL_SESSION" ]; then
    plugins+=(zsh-autosuggestions zsh-syntax-highlighting)
fi

if [[ $('uname') == 'Linux' ]]; then
fi

if [[ $('uname') == 'Darwin' ]]; then
    plugins+=(brew)
    export HOMEBREW_NO_AUTO_UPDATE=1
fi

# Create user level tmp
(! test -e /tmp/$USER_tmp_inited) && rm -rf ~/.tmp && mkdir -p ~/.tmp && chmod 700 ~/.tmp && touch /tmp/$USER_tmp_inited

# Env Profile
if [ -f ~/.env_profile ]; then
    source ~/.env_profile
fi

# Alias
source ~/.alias_profile

export DISABLE_AUTO_UPDATE="true"
source $ZSH/oh-my-zsh.sh

# Completions
if type brew &>/dev/null; then
    export FPATH=$(brew --prefix)/share/zsh-completions:$(brew --prefix)/share/zsh/site-functions:$FPATH
fi
autoload -Uz compinit
compinit

# Starship
if type starship &>/dev/null; then
  export STARSHIP_CONFIG="$HOME/.starship.toml"
  eval "$(starship init zsh)"
fi
