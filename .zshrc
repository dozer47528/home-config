if [ -f ~/.init_profile ]; then
    . ~/.init_profile
fi

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="simple"
plugins=(extract z git git-extras kubectl minikube helm gitignore mvn bower gitfast github npm python pip docker bazel sdk zsh-autosuggestions zsh-syntax-highlighting)

if [[ $('uname') == 'Linux' ]]; then
fi

if [[ $('uname') == 'Darwin' ]]; then
    plugins+=(brew)
    export HOMEBREW_NO_AUTO_UPDATE=1
    if  [ -d '/Applications/Visual Studio Code.app' ]; then
        alias vs="open -a '/Applications/Visual Studio Code.app'"
    fi
fi

export DISABLE_AUTO_UPDATE="true"
source $ZSH/oh-my-zsh.sh

# Create user level tmp
(! test -e /tmp/"$USER"_tmp_inited) && rm -rf ~/.tmp && mkdir -p ~/.tmp && chmod 700 ~/.tmp && touch /tmp/"$USER"_tmp_inited

# Sdkman
if [[ -d $HOME/.sdkman ]]; then
  export SDKMAN_DIR="$HOME/.sdkman"
  [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
fi

# Completions
if type brew &>/dev/null; then
    export FPATH=$(brew --prefix)/share/zsh-completions:$(brew --prefix)/share/zsh/site-functions:$FPATH
fi
export FPATH=$HOME/.bin:$FPATH
autoload -Uz compinit
compinit

if [ -f ~/.env_profile ]; then
    . ~/.env_profile
fi

# Prompt
# fpath+=($HOME/.zsh-themes/pure)
# autoload -U promptinit; promptinit
# zstyle :prompt:pure:git:stash show yes
# prompt pure

# Alias
. ~/.alias_profile
