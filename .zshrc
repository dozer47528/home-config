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
    if  [ -d '/Volumes/External/Applications/IntelliJ IDEA.app' ]; then
        alias idea="open -a '/Volumes/External/Applications/IntelliJ IDEA.app'"
    fi
    if  [ -d '/Applications/IntelliJ IDEA.app' ]; then
        alias idea="open -a '/Applications/IntelliJ IDEA.app'"
    fi

    if  [ -d '/Volumes/External/Applications/Goland.app' ]; then
        alias goland="open -a '/Volumes/External/Applications/Goland.app'"
    fi
    if  [ -d '/Applications/Goland.app' ]; then
        alias goland="open -a '/Applications/Goland.app'"
    fi

    if  [ -d '/Volumes/External/Applications/PyCharm.app' ]; then
        alias pycharm="open -a '/Volumes/External/Applications/PyCharm.app'"
    fi
    if  [ -d '/Applications/PyCharm.app' ]; then
        alias pycharm="open -a '/Applications/PyCharm.app'"
    fi

    if  [ -d '/Volumes/External/Applications/WebStorm.app' ]; then
        alias webstorm="open -a '/Volumes/External/Applications/WebStorm.app'"
    fi
    if  [ -d '/Applications/WebStorm.app' ]; then
        alias webstorm="open -a '/Applications/WebStorm.app'"
    fi

    if  [ -d '/Volumes/External/Applications/CLion.app' ]; then
        alias clion="open -a '/Volumes/External/Applications/CLion.app'"
    fi
    if  [ -d '/Applications/CLion.app' ]; then
        alias clion="open -a '/Applications/CLion.app'"
    fi

    if  [ -d '/Volumes/External/Applications/Visual Studio Code.app' ]; then
        alias vs="open -a '/Volumes/External/Applications/Visual Studio Code.app'"
    fi
    if  [ -d '/Applications/Visual Studio Code.app' ]; then
        alias vs="open -a '/Applications/Visual Studio Code.app'"
    fi
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

. ~/.alias_profile
