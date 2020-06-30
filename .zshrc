ZSH=$HOME/.oh-my-zsh
ZSH_THEME="powerlevel10k/powerlevel10k"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

plugins=(extract z git tmux git-extras kubectl kube-ps1 helm gitignore mvn bower gitfast github npm python pip docker zsh-autosuggestions zsh-syntax-highlighting)

if [[ $('uname') == 'Darwin' ]]; then
    plugins+=(brew)
    export HOMEBREW_NO_AUTO_UPDATE=1
fi

source $ZSH/oh-my-zsh.sh

source ~/.p10k.zsh

if [ -f ~/.env_profile ]; then
    . ~/.env_profile
fi

if [ -f ~/.alias_profile ]; then
    . ~/.alias_profile
fi

if [[ $('uname') == 'Linux' ]]; then
fi

if [[ $('uname') == 'Darwin' ]]; then
    plugins+=(brew)
    alias idea="open -a '/Applications/IntelliJ IDEA.app'"
    alias goland="open -a '/Applications/Goland.app'"
    alias charm="open -a '/Applications/PyCharm.app'"
    alias ws="open -a '/Applications/WebStorm.app'"
    alias clion="open -a '/Applications/CLion.app'"
    alias vs="open -a '/Applications/Visual Studio Code.app'"
    command -v trash > /dev/null && alias rm=trash
fi

# Create user level tmp
(! test -e /tmp/"$USER"_tmp_inited) && rm -rf ~/.tmp && mkdir -p ~/.tmp && touch /tmp/"$USER"_tmp_inited

# Completions
fpath=(/usr/local/share/zsh-completions $fpath)
fpath=(/usr/local/share/zsh/site-functions $fpath)
autoload -Uz compinit
compinit
