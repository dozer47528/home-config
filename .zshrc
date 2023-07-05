export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
ZSH=$HOME/.oh-my-zsh

ZSH_THEME=""
plugins=(extract z git git-extras kubectl helm gitignore mvn bower gitfast github npm python pip docker bazel sdk zsh-autosuggestions zsh-syntax-highlighting)

if [[ $('uname') == 'Linux' ]]; then
fi

if [[ $('uname') == 'Darwin' ]]; then
    plugins+=(brew)
    export HOMEBREW_NO_AUTO_UPDATE=1
fi

# Create user level tmp
(! test -e /tmp/"$USER"_tmp_inited) && rm -rf ~/.tmp && mkdir -p ~/.tmp && chmod 700 ~/.tmp && touch /tmp/"$USER"_tmp_inited

# Env
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
export FPATH=$HOME/.bin:$FPATH
autoload -Uz compinit
compinit

# Prompt
fpath+=($HOME/.zsh-themes/pure)
autoload -U promptinit; promptinit
prompt pure