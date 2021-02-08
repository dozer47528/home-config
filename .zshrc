if [ -f ~/.init_profile ]; then
    . ~/.init_profile
fi

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
ZSH=$HOME/.oh-my-zsh

if [[ "$LIGHT" == "1" ]]; then
    ZSH_THEME="example"
    plugins=(extract z git tmux git-extras kubectl minikube helm gitignore mvn bower gitfast github npm python pip docker bazel)
else
    ZSH_THEME="powerlevel10k/powerlevel10k"
    plugins=(extract z git tmux git-extras kubectl minikube helm gitignore mvn bower gitfast github npm python pip docker bazel zsh-autosuggestions zsh-syntax-highlighting)
fi

if [[ $('uname') == 'Linux' ]]; then
fi

if [[ $('uname') == 'Darwin' ]]; then
    plugins+=(brew)
    export HOMEBREW_NO_AUTO_UPDATE=1
    alias idea="open -a '/Applications/IntelliJ IDEA.app'"
    alias goland="open -a '/Applications/Goland.app'"
    alias charm="open -a '/Applications/PyCharm.app'"
    alias ws="open -a '/Applications/WebStorm.app'"
    alias clion="open -a '/Applications/CLion.app'"
    alias vs="open -a '/Applications/Visual Studio Code.app'"
fi

export DISABLE_AUTO_UPDATE="true"
source $ZSH/oh-my-zsh.sh

if [[ "$LIGHT" != "1" ]]; then
    source ~/.p10k.zsh
fi

# Create user level tmp
(! test -e /tmp/"$USER"_tmp_inited) && rm -rf ~/.tmp && mkdir -p ~/.tmp && chmod 700 ~/.tmp && touch /tmp/"$USER"_tmp_inited

# Completions
fpath=(/usr/local/share/zsh-completions $fpath)
fpath=(/usr/local/share/zsh/site-functions $fpath)
fpath=($HOME/.bin $fpath)
autoload -Uz compinit && compinit

if [ -f ~/.env_profile ]; then
    . ~/.env_profile
fi

if [ -f ~/.alias_profile ]; then
    . ~/.alias_profile
fi
